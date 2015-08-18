Rails.application.routes.draw do
  get 'example/index'

  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  devise_for :managers, controllers: { invitations: "managers/invitations", sessions: "managers/sessions", registrations: "managers/registrations" }


  # constraints for subdomains
  cnstrs = {subdomain: ENV["CRM_SUBDOMAIN"]}
  cnstrs = {} if ENV["LOCALHOST"] == "true"


  # CRM routes

  constraints cnstrs do
    #get "ng", to: "crm#ng"

    with_options defaults: {format: "html"} do
      get "skin-config", to: "crm#skin_config"
      root to: "dashboard#index", as: :crm_root

      resources :clients, :managers, :admins, :buildings, :building_complexes, :penthouses, :apartments, :apartment_houses do
        resources :assets, :comments
      end




      post "managers/invite"
    end
  end

  # Site routes

  root to: "application#site_home"

  match "*url", to: "application#render_not_found", via: [:get]

end
