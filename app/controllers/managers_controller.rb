class ManagersController < CrmController
  before_action :set_manager, only: [:show, :edit, :update, :destroy]
  before_action :authorize_to_users!
  respond_to :json


  def authorize_to_users!
    if cannot?(:manage, :users)
      render_unauthorized
    end
  end

  # GET /managers
  # GET /managers.json
  def index
    @managers = Manager.all
    #respond_with @managers
    respond_to do |format|
      format.json
      format.html
    end
  end

  # GET /managers/1
  # GET /managers/1.json
  def show
  end

  # GET /managers/new
  def new
    @manager = Manager.new
    @manager.user_info = UserInfo.new
    @manager.user_info.address = Address.new
  end

  # GET /managers/1/edit
  def edit
    @manager.user_info ||= UserInfo.new
    @manager.user_info.address ||= Address.new
  end

  # POST /managers
  # POST /managers.json
  def create
    @manager = Manager.new(manager_params)

    respond_to do |format|
      if @manager.save
        format.html { redirect_to @manager, notice: 'Manager was successfully created.' }
        format.json { render :show, status: :created, location: @manager }
      else
        @manager.user_info ||= UserInfo.new
        @manager.user_info.address ||= Address.new
        format.html { render :new }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managers/1
  # PATCH/PUT /managers/1.json
  def update
    local_manager_params = manager_params
    if local_manager_params[:password].blank?
      local_manager_params.slice!(:password, :password_confirmation)
    end
    respond_to do |format|
      if @manager.update(local_manager_params)
        format.html { redirect_to @manager, notice: 'Manager was successfully updated.' }
        format.json { render :show, status: :ok, location: @manager }
      else
        @manager.user_info ||= UserInfo.new
        @manager.user_info.address ||= Address.new
        format.html { render :edit }
        format.json { render json: @manager.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managers/1
  # DELETE /managers/1.json
  def destroy
    @manager.destroy
    respond_to do |format|
      format.html { redirect_to managers_url, notice: 'Manager was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def invite

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_manager
      @manager = Manager.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def manager_params
      params.require(:manager).permit(:email, :password, :password_confirmation, :full_name, :avatar, :full_address, user_info_attributes: [:first_name, :last_name, :middle_name, :avatar, address_attributes: [:street, :house_number, :apartment_number, :index, :city, :country]] )
    end
end
