class ApartmentsController < BuildingsController

  def resource_class
    Apartment
  end

  protected

  def building_params

    params.require(:apartment).permit(:type, :price, :price_currency, :name, :house_number, :apartment_number, *(Apartment.details_attribute_names), :street, :index, :city, :country, :full_address, :level)
  end


end