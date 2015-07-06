class Apartment < Building
  attr_accessible(*attribute_names)

  has_one :apartment_info, as: :building, autosave: true

  delegate_with_setter :square, to: :apartment_info, allow_nil: true

  has_one :apartment_details, autosave: true



  delegate_with_setter :level, to: :apartment_details, allow_nil: true

  def self.details_attribute_names
    [:exterior_walls_description, :appartment_separator_walls_description, :appartment_inner_separator_walls_description, :height_description, :filling_openings_in_walls_description, :phone_description, :internet_description, :tv_description, :kitchen_stove_description, :wiring_description, :plumbing_description, :heating_description, :ventilation_description, :water_supply_description, :meters_description, :internal_sewer_system_description, :internal_finishing_work_description, :beautification_description, :additional_info]
  end



  delegate_with_setter *(details_attribute_names), to: :apartment_details, allow_nil: true

  def styles
    {
        bannewr: "2000x500"
    }
  end
end


