class BuildingComplex < Building
  has_many :building_complex_links

  has_many :buildings, through: :building_complex_links

  def self.path_name(action, *args)
    resource_class_name = self.class.name.underscore
    p = "#{action}_#{resource_class_name}_path"
    return p
  end

  def url_helpers
    @_url_helpers ||= Rails.application.routes.url_helpers
  end
end