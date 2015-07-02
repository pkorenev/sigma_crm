class BuildingComplex < Building
  has_many :building_complex_links

  has_many :buildings, through: :building_complex_links

  has_one :building_complex_details, autosave: true
  attr_accessible :building_complex_details
  auto_build :building_complex_details

  def self.details_attribute_names
    [:price_per_meter, :price_per_meter_currency, :building_start_date, :estimated_building_end_date, :main_purpose, :commercial_premises, :levels_count, :apartments_count, :sections_count, :construction_description, :construction_material_text, :exterior_walls_description, :insulation_type_description, :fasade_description, :windows_description, :parking_type_description, :roof_structure, :level_height, :heating_type, :lifts_count, :additional_description]
  end



  delegate_with_setter :name, *(BuildingComplex.details_attribute_names), to: :building_complex_details, allow_nil: true
  
  
  
  

  

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