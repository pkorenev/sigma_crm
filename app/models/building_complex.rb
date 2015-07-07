class BuildingComplex < Building
  has_many :building_complex_links

  has_many :buildings, through: :building_complex_links

  has_one :building_complex_details, autosave: true, class_name: "HouseDetails", as: :house
  attr_accessible :building_complex_details
  auto_build :building_complex_details





  delegate_with_setter :name, *(HouseDetails.details_attribute_names), to: :building_complex_details, allow_nil: true
  
  
  
  

  

  [:apartments, :apartment_houses, :penthouses].each do |attr|
    if attr.to_s.plural?
      has_many attr, -> { where( type: attr.to_s.singularize.classify ) }, through: :building_complex_links, source: :building
    end
  end

  def self.path_name(action, *args)
    resource_class_name = self.class.name.underscore
    p = "#{action}_#{resource_class_name}_path"
    return p
  end

  def url_helpers
    @_url_helpers ||= Rails.application.routes.url_helpers
  end

  # def apartments
  #   buildings.where(type: "Apartment")
  #   ActiveRecord::Associations::CollectionProxy
  # end
end

#
#
#