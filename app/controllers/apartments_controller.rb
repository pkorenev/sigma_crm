class ApartmentsController < BuildingsController

  def index
    super
    @table_columns = [ 'Адреса', 'Price', 'Price currency']
  end

  def resource_class
    Apartment
  end

  protected

  def building_params
    arr = [:exterior_walls_description, :appartment_separator_walls_description, :appartment_inner_separator_walls_description, :height_description, :filling_openings_in_walls_description, :phone_description, :internet_description, :tv_description, :kitchen_stove_description, :wiring_description, :plumbing_description, :heating_description, :ventilation_description, :water_supply_description, :meters_description, :internal_sewer_system_description, :internal_finishing_work_description, :beautification_description, :additional_info]
    params.require(:apartment).permit(:type, :price, :price_currency, :name, :house_number, :apartment_number, *arr, :street, :index, :city, :country, :full_address, :level)
  end

  def set_building
    @building = resource_class.find(params[:id]) rescue render_not_found
  end
end