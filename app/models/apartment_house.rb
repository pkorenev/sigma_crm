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

class ApartmentHouse < Building
  has_one :apartment_house_details, autosave: true, class_name: "HouseDetails", as: :house
  attr_accessible :apartment_house_details
  auto_build :apartment_house_details


  belongs_to :parent, polymorphic: true, foreign_key: :parent_id
  has_many :children, class_name: "Building", as: :parent

  #belongs_to :building_complex, polymorphic: true, foreign_key: :parent_id, class_name: "BuildingComplex"

  belongs_to :building_complex, foreign_key: :parent_id

  has_many :apartments, class_name: "Apartment", as: :parent
  #, conditions: ["'parent_type' == ?", "ApartmentHouse"]


  delegate_with_setter *(HouseDetails.details_attribute_names), to: :apartment_house_details, allow_nil: true

  #delegate_with_setter :street, :city, to: [:address, :building_complex], prefix: "computed"

  def styles
    {
        avatar: "400x200"
    }
  end

  def house_address

    if computed_street.present? && house_number.present?
      "#{computed_street}, #{house_number}"
    else
      nil
    end
  end

  # def street
  #   s = self.street
  #   if s.blank?
  #     building_complex.street
  #   end
  #
  #   return s
  # end

  def house_address=(value)

  end

  def computed_street
    s = street
    s = building_complex.try(&:street)  if s.blank?
  end

  def computed_house_number
    res = house_number
    res = building_complex.try(&:house_number) if res.blank?
  end



  def to_s
    house_address
  end

  def self.details_attribute_names
    HouseDetails.details_attribute_names
  end

end
