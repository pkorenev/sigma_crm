class ApartmentHouse < Building
  has_one :apartment_house_details, autosave: true, class_name: "HouseDetails", as: :house
  attr_accessible :apartment_house_details
  auto_build :apartment_house_details

  def self.details_attribute_names
    [:price_per_meter, :price_per_meter_currency, :building_start_date, :estimated_building_end_date, :main_purpose, :commercial_premises, :levels_count, :apartments_count, :sections_count, :construction_description, :construction_material_text, :exterior_walls_description, :insulation_type_description, :fasade_description, :windows_description, :parking_type_description, :roof_structure, :level_height, :heating_type, :lifts_count, :additional_description]
  end



  delegate_with_setter :name, *(details_attribute_names), to: :apartment_house_details, allow_nil: true

  def styles
    {
        avatar: "400x200"
    }
  end

end