# Be sure to restart your server when you modify this file.

#Rails.application.config.session_store :cookie_store, key: '_sigma_db_session'
Rails.application.config.session_store :cookie_store, key: ENV['SESSION_COOKIE_KEY'], domain: ENV['TOP_LEVEL_DOMAIN']
#Rails.application.config.session_store :cookie_store, key: '_tourlyapp_session', :domain => "lvh.me"