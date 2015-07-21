class BuildingComplexesController < BuildingContainersController
  before_action do

  end

  def index
    #@resources ||= BuildingComplex.all.limit(100)
    super
  end

  def resource_params
    super
    #params.require(resource_name).permit(:full_description, :status, :type, :price, :price_currency, :name, :country, :city, *(HouseDetails.details_attribute_names), :avatar)

    #params.require(resource_name).permit(*(Address.form_fields), :utf8, :_method, :authenticity_token, :building_complex, :format, :id, :latitude, :longitude, :avatar, :name)
  end

  def resource_class
    BuildingComplex
  end
end
