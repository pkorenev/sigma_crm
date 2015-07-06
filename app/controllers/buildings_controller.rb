class BuildingsController < ResourcesController
  def resource_class
    Building
  end

  def index
    @resources ||= resource_class.all.includes(:address).limit(100)

  end
end