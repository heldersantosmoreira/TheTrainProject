TrainCompanyServer::Application.routes.draw do
  resources :ticket_routes

  resources :prices

  resources :tickets

  resources :route_stops

  resources :routes

  resources :distances

  resources :stops

  resources :cards

  resources :users

  get "get_route", :to => "routes#get_route"
  get "login", :to => "users#login"
  get "signup", :to => "users#signup"
  get "getCardsByUserId", :to => "cards#getByUserId"
  get "addCardToUser", :to => "cards#addCard"
  get "removeCard", :to => "cards#removeCard"
  get "verifyTicket", :to => "tickets#verify_ticket"
  get "newTicket", :to => "tickets#new_ticket"
  get "addTicketRoutes", :to => "ticket_routes#new_ticket"
  get "getTicketsByUserId", :to => "tickets#getByUserId"
  get "cancelTicket", :to => "tickets#cancel"
  get "payTicket", :to => "tickets#pay"
  get "getPaidTicketsByUserId", :to => "tickets#getPaidByUserId"
  get "getPaidTickets", :to => "tickets#getPaid"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
