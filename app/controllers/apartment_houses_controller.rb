class ApartmentHousesController < BuildingContainersController
  def resource_class
    ApartmentHouse
  end

  def building_params
    super
    #params.require(resource_name).permit(:type, :price, :price_currency, :name, :country, :city, *(HouseDetails.details_attribute_names))
  end
end