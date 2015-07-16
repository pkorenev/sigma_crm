class BuildingsController < ResourcesController

  before_action :add_breadcrumbs
  before_action :new_breadcrumbs, only: :new
  before_action :show_breadcrumbs, only: :show
  before_action :edit_breadcrumbs, only: :edit

  def new_breadcrumbs
    @breadcrumbs << {name: t("models.#{resource_class.name.underscore}.new")}
  end

  def show_breadcrumbs
    @breadcrumbs << {name: @resource.to_s}
  end

  def edit_breadcrumbs
    @breadcrumbs << {name: @resource.to_s, url: url_for(@resource)}
    @breadcrumbs << {name: @resource.to_s}
  end

  def resource_class
    Building
  end

  def index
    @resources ||= resource_class.all.includes(:address)#.limit(100)

  end

  def resource_params
    super
    params.permit(resource_name).permit(Address.form_fields, :utf8, :_method, :authenticity_token, :building_complex, :format, :id, :latitude, :longitude, :avatar)
    #params.permit(:avatar)
    #params.require(resource_name).permit(:avatar)
  end

  def add_breadcrumbs
    @breadcrumbs << {name: t("breadcrumbs.buildings")}
    @breadcrumbs << {name: resource_class.human_model_name(multiple: true), url: url_for(resource_class)}
  end
end