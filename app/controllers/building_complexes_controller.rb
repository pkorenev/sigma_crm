class BuildingComplexesController < BuildingsController
  set_resource_attributes :resource_class => BuildingComplex, :parent_resource_class => Building

  # before_action :set_building_complex, only: [:show, :edit, :update, :destroy]
  #
  # # GET /building_complexes
  # # GET /building_complexes.json
  # def index
  #   @building_complexes = BuildingComplex.all
  # end
  #
  # # GET /building_complexes/1
  # # GET /building_complexes/1.json
  # def show
  # end
  #
  # # GET /building_complexes/new
  # def new
  #   @building_complex = BuildingComplex.new
  # end
  #
  # # GET /building_complexes/1/edit
  # def edit
  # end
  #
  # # POST /building_complexes
  # # POST /building_complexes.json
  # def create
  #   @building_complex = BuildingComplex.new(building_complex_params)
  #
  #   respond_to do |format|
  #     if @building_complex.save
  #       format.html { redirect_to @building_complex, notice: 'Building complex was successfully created.' }
  #       format.json { render :show, status: :created, location: @building_complex }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @building_complex.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # PATCH/PUT /building_complexes/1
  # # PATCH/PUT /building_complexes/1.json
  # def update
  #   respond_to do |format|
  #     if @building_complex.update(building_complex_params)
  #       format.html { redirect_to @building_complex, notice: 'Building complex was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @building_complex }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @building_complex.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /building_complexes/1
  # # DELETE /building_complexes/1.json
  # def destroy
  #   @building_complex.destroy
  #   respond_to do |format|
  #     format.html { redirect_to building_complexes_url, notice: 'Building complex was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_building_complex
  #     @building_complex = BuildingComplex.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def building_complex_params
  #     params[:building_complex]
  #   end

  # def index
  #
  # end

  # def set_building
  #   @building = BuildingComplex.find(params[:id])
  # end

  def building_params
    super
    params.require(resource_name).permit(:type, :price, :price_currency, :name, :country, :city, *(BuildingComplex.details_attribute_names))
  end

  def associated_model_class
    BuildingComplex
  end

  def resource_class
    BuildingComplex
  end
end
