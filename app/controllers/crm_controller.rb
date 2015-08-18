class CrmController < ApplicationController
  before_action :authenticate_user!, unless: :json_request?
  #before_action :fill_user_profile, unless: :json_request?
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

  # def my_authenticate_user!
  #   if current_user.nil?
  #     redirect_to new_user_session_path
  #   end
  # end

  def fill_user_profile
    if current_user.profile_status.unfilled?
      user_role_name = current_user.class.name.underscore
      redirect_to send("edit_#{user_role_name}_registration_path")
    end
  end

end