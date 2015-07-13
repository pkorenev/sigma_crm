Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "users/sessions" }

  # constraints for subdomains
  cnstrs = {subdomain: ENV["CRM_SUBDOMAIN"]}
  cnstrs = {} if ENV["LOCALHOST"] == "true"


  # CRM routes

  constraints cnstrs do
    #get "ng", to: "crm#ng"

    with_options defaults: {format: "html"} do
      get "skin-config", to: "crm#skin_config"
      root to: "dashboard#index", as: :crm_root

      resources :clients, :managers, :buildings, :building_complexes, :penthouses, :apartments, :apartment_houses do
        resources :assets
      end

      post "managers/invite"
    end
  end

  # Site routes

  root to: "application#site_home"

end
