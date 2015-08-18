class ManagersController < ResourcesController
  #before_action :authorize_to_users!
  respond_to :json

  skip_before_filter :verify_authenticity_token



  def authorize_to_users!
    if cannot?(:manage, :users)
      render_unauthorized
    end
  end

  def invite

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:manager).permit(:email, :password, :first_name, :middle_name, :last_name, :phone, :country, :city, :street, :house_number, :apartment_number, :password_confirmation, :full_name, :avatar, :full_address, user_info_attributes: [:first_name, :last_name, :middle_name, :avatar, address_attributes: [:street, :house_number, :apartment_number, :index, :city, :country]] )
    end
end
