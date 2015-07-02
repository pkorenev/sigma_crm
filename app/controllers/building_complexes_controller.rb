class BuildingComplexesController < BuildingsController



  def building_params
    super
    params.require(resource_name).permit(:type, :price, :price_currency, :name, :country, :city, *(BuildingComplex.details_attribute_names))
  end

  def resource_class
    BuildingComplex
  end
end
