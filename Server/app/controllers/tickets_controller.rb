# -*- coding: utf-8 -*-
class TicketsController < ApplicationController
  # GET /tickets
  # GET /tickets.json
  def index
    @tickets = Ticket.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tickets }
    end
  end

  def verify_ticket
    route_id = params[:route_id]
    stop_start = params[:stop_start]
    stop_end = params[:stop_end]
    date = params[:date]
    date = Time.parse(date).strftime("%Y-%m-%d")

    stop_start_order = RouteStop.where(:route_id => route_id, :stop_id => Stop.where(:location => stop_start).first).first.stop_order
    stop_end_order = RouteStop.where(:route_id => route_id, :stop_id => Stop.where(:location => stop_end).first).first.stop_order

    tickets_from_route = TicketRoute.where(["route_id = ? and stop_start_order >= ? and stop_end_order <= ? and date = ?", route_id, stop_start_order, stop_end_order, date])

    response = ["yes"]
    if tickets_from_route.length > 0
     response[0] = "no"
    end

    respond_to do |format|
      format.json { render json: response }
    end

  end

  def getByUserId
    tickets = Ticket.where("user_id = ?", params[:user_id])
    respond_to do |format|
      format.json { render json: tickets }
    end
  end


  # GET /tickets/1
  # GET /tickets/1.json
  def show
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.json
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = Ticket.find(params[:id])
  end

  # POST /tickets
  # POST /tickets.json
  def create
    @ticket = Ticket.new(params[:ticket])

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to @ticket, notice: 'Ticket was successfully created.' }
        format.json { render json: @ticket, status: :created, location: @ticket }
      else
        format.html { render action: "new" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.json
  def update
    @ticket = Ticket.find(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to @ticket, notice: 'Ticket was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.json
  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to tickets_url }
      format.json { head :no_content }
    end
  end
end
