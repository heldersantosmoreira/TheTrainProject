class Stop < ActiveRecord::Base
	has_many :stops1, :class_name => "Distance", :foreign_key => "stop1_id"
	has_many :stops2, :class_name => "Distance", :foreign_key => "stop2_id"
	has_many :stops_start, :class_name => "Ticket", :foreign_key => "stop_start_id"
	has_many :stops_end, :class_name => "Ticket", :foreign_key => "stop_end_id"
	has_many :route_stops
	attr_accessible :location
end
