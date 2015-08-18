class Managers::InvitationsController < Devise::InvitationsController
  respond_to :html, :json

  skip_before_filter :authenticate_inviter!

  def authenticate_inviter!
    current_user
    #authenticate_admin!(:force => true)
  end
end