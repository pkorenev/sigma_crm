Rails.application.routes.draw do
  scope :scheme, controller: "scheme" do
    get "house_details_attributes"
  end




  #resources :things
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #devise_for :manager_users, controllers: {  }
  devise_for :users, controllers: { sessions: "users/sessions" }

  cnstrs = {subdomain: ENV["CRM_SUBDOMAIN"]}
  cnstrs = {} if ENV["LOCALHOST"] == "true"
  #cnstrs[:defaults] = {format: "json"}
  constraints cnstrs do
    #get "ng", to: "crm#ng"
    root to: "crm#dashboard", as: "crm_root"
    with_options defaults: {format: "html"} do
      get "skin-config", to: "crm#skin_config"
      get "buildings/objects_count"
      #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
      root to: "crm#dashboard", as: :crm_dashboard
      resources :clients
      resources :managers
      resources :buildings
      resources :building_complexes do
        resources :assets
      end
      resources :penthouses
      resources :apartments
      resources :apartment_houses

      post "managers/invite"
    end
  end

  root to: "application#site_home"

  resources :user_infos

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
