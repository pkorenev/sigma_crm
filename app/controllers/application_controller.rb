require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :json

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  protect_from_forgery with: :null_session


  def render_unauthorized
    render file: Rails.root.join("public/401.html"), layout: false, status: 401
  end

  def render_not_found
    render file: Rails.root.join("public/404.html"), layout: false, status: 404
  end

  def site_home
    render template: "layouts/application", layout: false
  end

  def set_csrf_headers
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end
end
