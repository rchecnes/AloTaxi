Rails.application.routes.draw do
  

  get 'price_list/index'

  resources :menu_roles
  devise_for :users
  
  
  resources :inmediate_services
  get 'service_history/index'

  get 'service_operators/index'
  get 'service_drivers/index'
  get "service_drivers/accept_service" => 'service_drivers#accept_service', :as => :accept_service
  get "service_drivers/reject_service" => 'service_drivers#reject_service', :as => :reject_service
  get "service_drivers/start_service" => 'service_drivers#start_service', :as => :start_service
  get "service_drivers/terminate_service" => 'service_drivers#terminate_service', :as => :terminate_service

  get "services/list_favorite/:address_type" => 'services#list_favorite', :as => :list_favorite
  #get "services/calculate_price/:data" => 'services#calculate_price', :as => :calculate_price

  get "service_operators/list_vehicle/:id" => 'service_operators#list_vehicle', :as => :list_vehicle
  get "service_operators/list_driver/:id" => 'service_operators#list_driver', :as => :list_driver
  get "service_operators/assign_vehicle" => 'service_operators#assign_vehicle', :as => :assign_vehicle
  get "service_operators/assign_driver" => 'service_operators#assign_driver', :as => :assign_driver
  get "service_operators/confirm_assigned" => 'service_operators#confirm_assigned', :as => :confirm_assigned
  
  
  

  
  resources :service_drivers
  resources :service_operators
  resources :rates
  resources :favorites
  resources :addresses
  
  resources :vehicles
  resources :people

  resources :roles
  resources :vehicle_types
  resources :service_types
  resources :payment_types
  resources :districts
  resources :services
  

  get 'home/index'
  
  root 'home#index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
