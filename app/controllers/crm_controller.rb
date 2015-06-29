class CrmController < ApplicationController
  #before_action :authenticate_user!

  self.layout "crm"

  def dashboard
    render template: "dashboard/index"
  end

  def ng
    render template: "layouts/ng_index", layout: false
  end



end