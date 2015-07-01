class BuildingsController < CrmController
  before_action :set_building, only: [:show, :edit, :update, :destroy]

  #class_attribute :resource_class, :parent_resource_class

  # GET /buildings
  # GET /buildings.json
  def index
    #@buildings = associated_model_class.available_for_user(current_user)
    @buildings = resource_class.available_for_user(current_user).page(params[:page]).per(25)
    #instance_variable_set("@#{self.parent_resource_class.name.underscore.pluralize}".to_sym, self.resource_class.available_for_user(current_user))

    @table_columns = [ 'Address',  'Price', 'Price currency']
    if resource_class == Building
      @table_columns.insert(0, "Type")
    end
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = resource_class.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = resource_class.new()
    @building.assign_attributes(building_params)
    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully created.' }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    @building.assign_attributes(building_params)
    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, notice: 'Building was successfully updated.' }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to buildings_url, notice: 'Building was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # def resource
  #
  # end
  #
  # helper_method :my_method

  def objects_count
    obj_count = {total_count: Building.count, building_complexes_count: BuildingComplex.count, apartments_count: Apartment.count, penthouses_count: Penthouse.count}
    render json: obj_count
  end



  def new_resource_path(*args)
    path_name = "new_#{resource_name}_path"
    url_helpers.send(path_name, args)
  end

  def resource_path(*args)
    path_name = "#{resource_name}_path"
    url_helpers.send(path_name, args)
  end

  def edit_resource_path(*args)
    path_name = "edit_#{resource_name}_path"
    url_helpers.send(path_name, args)
  end

  def resources_path(*args)
    path_name = "#{resource_name.pluralize}_path"
    url_helpers.send(path_name, args)
  end

  def resource_class
    Building
  end

  def resource_name
    resource_class.name.underscore.to_sym
  end

  helper_method :new_resource_path, :resource_path, :edit_resource_path, :resources_path





  def url_helpers
    @_url_helpers ||= Rails.application.routes.url_helpers
  end


  protected
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = resource_class.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def building_params
      params.require(:building).permit(:type, :price, :price_currency)
    end

    def associated_model_class
      Building
    end

    def self.set_resource_attributes(options={})
      #self.resource_class = options[:resource_class]
      #self.parent_resource_class = options[:parent_resource_class]
      #instance_variable_set(:@resource_class, self.resource_class)
    end
end
