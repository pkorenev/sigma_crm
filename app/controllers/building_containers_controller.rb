class BuildingContainersController < BuildingsController
  def resource_params
    super
    #params.require(resource_name).permit(*([*resource_class.attribute_names, *HouseDetails.attribute_names].uniq))
  end

end