# == Schema Information
#
# Table name: buildings
#
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  full_description    :text
#  id                  :integer          not null, primary key
#  parent_id           :integer
#  parent_type         :string
#  price               :integer
#  price_currency      :string
#  published           :boolean
#  status              :string
#  type                :string
#  updated_at          :datetime         not null
#

class Apartment < Building
  #attr_accessible(*attribute_names)

  has_one :apartment_info, as: :building, autosave: true

  delegate_with_setter :square, to: :apartment_info, allow_nil: true

  has_one :apartment_details, autosave: true

  belongs_to :parent, polymorphic: true, foreign_key: :parent_id, class_name: "Building"

  #belongs_to :apartment_house, polymorphic: true, foreign_key: :parent_id, class_name: "ApartmentHouse"
  belongs_to :apartment_house, ->(apartment) { where(type: "ApartmentHouse") }, foreign_key: :parent_id
  #has_one :apartment_house

  has_one :building_complex, through: :apartment_house



  delegate_with_setter :level, to: :apartment_details, allow_nil: true

  def self.details_attribute_names
    [:exterior_walls_description, :apartment_separator_walls_description, :apartment_inner_separator_walls_description, :height_description, :filling_openings_in_walls_description, :phone_description, :internet_description, :tv_description, :kitchen_stove_description, :wiring_description, :plumbing_description, :heating_description, :ventilation_description, :water_supply_description, :meters_description, :internal_sewer_system_description, :internal_finishing_work_description, :beautification_description, :additional_info]
  end



  delegate_with_setter *(ApartmentInfo.form_attribute_names), to: :apartment_info, allow_nil: true

  #delegate_with_setter :house_number, to: [:address, :apartment_house], prefix: "computed"

  #delegate_with_setter :street, :city, to: [:address, :building_complex], prefix: "computed"

  def styles
    {
        banner: "2000x500"
    }
  end

  def to_s
    "#{computed_street}, #{computed_house_number}/#{apartment_number}"
  end

  def self.details_attribute_names
    ApartmentInfo.form_attribute_names
  end

  def computed_house_number
    apartment_house.house_number
  end

  def computed_street
    apartment_house.computed_street
  end

  def url

  end

end
