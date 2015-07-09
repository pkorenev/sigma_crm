class BuildingsController < ResourcesController
  def resource_class
    Building
  end

  def index
    @resources ||= resource_class.all.includes(:address).limit(100)

  end

  def resource_params
    super
    #params.permit(:avatar)
    #params.require(resource_name).permit(:avatar)
  end
end