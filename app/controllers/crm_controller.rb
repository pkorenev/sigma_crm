class CrmController < ApplicationController
  #before_action :authenticate_user!

  self.layout "crm_static"

  def dashboard
    render template: "dashboard/index"
  end

  def ng
    render template: "layouts/ng_index", layout: false
  end

  def skin_config
    render template: "layouts/skin_config.html.slim", layout: false
  end

end