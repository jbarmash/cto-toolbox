CtoToolbox::Application.routes.draw do

  resources :toolboxes

  root :to => "static_pages#home"

  get "static_pages/home"

  get "user/list"
  get "user/disable"
 # get "user/set_current_user/:id"
 #// get "user/:id/favorites"
 #// get "user/:id/tolearn"
 #// get :set_current_user, on: :member

  match 'users/:id/set_current_user' => 'users#set_current_user', :as => 'user_set_current_user', :via => "get"
  match 'tools/tag/:tag_name' => 'tools#filter_by_tag', :as => 'tool_filter_by_tag', :via => "get"
  match 'tools/:id/favorites' => 'tools#add_to_favorites', :as => 'tool_add_to_favorites', :via => "get" #TODO: change to post, and possibly change for this to be off /users endpoint

  match "/auth/twitter/callback" => "sessions#create"

  
  resources :users
  resources :tags

  resources :tools
  match 'tools_search' => 'Tools#search_by_name', :as => :tools_search_by_name, :via => "get"
  match 'mytools' => 'Tools#my_tools', :as => :my_tools, :via => "get"

  
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
  # match ':controller(/:action(/:id(.:format)))'
end
