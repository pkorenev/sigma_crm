class CrmController < ApplicationController
  before_action :authenticate_user!

  self.layout "crm"

  def dashboard
    render template: "dashboard/index"
  end

end