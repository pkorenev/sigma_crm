class CrmController < ApplicationController
  before_action :authenticate_user!
  before_action :create_breadcrumbs

  self.layout "crm"

  def ng
    render template: "layouts/ng_index", layout: false
  end

  def skin_config
    render template: "layouts/skin_config.html.slim", layout: false
  end

  private

  def create_breadcrumbs
    @breadcrumbs = []
  end

end