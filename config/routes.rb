OpentransactExample::Application.routes.draw do
  resources :assets

  resources :person_sessions
  resources :people

  #resources :transacts
  # XXX in 2.3.x, this was easier -> map.resources :transacts, :as => "transacts/:asset"
  get    "transacts(/:asset)(.:format)"          => "transacts#index",   :as => 'transacts'
  get    "transacts(/:asset)/new"                => "transacts#new",     :as => 'new_transact'
  get    "transacts(/:asset)/:id(.:format)"      => "transacts#show",    :as => 'transact'
  post   "transacts(/:asset)(.:format)"          => "transacts#create",  :as => 'transacts'
  delete "transacts(/:asset)/:id(.:format)"      => "transacts#destroy", :as => 'transact'
  #get    "transacts/[:asset]/:id/edit" => "transacts#edit",    :as => 'edit_transact'
  #put    "transacts/[:asset]/:id"      => "transacts#update",  :as => 'transact'
  
  match 'signup' => 'people#new', :as => :signup
  match 'login' => 'person_sessions#new', :as => :login
  match 'logout' => 'person_sessions#destroy', :as => :logout

  root :to => "assets#index"
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
