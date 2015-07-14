# == Schema Information
#
# Table name: buildings
#
#  id                  :integer          not null, primary key
#  type                :string
#  price               :integer
#  price_currency      :string
#  status              :string
#  parent_type         :string
#  parent_id           :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  published           :boolean
#  full_description    :text
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_content_type :string
#  avatar_updated_at   :datetime
#

class ApartmentHouse < Building
  has_one :apartment_house_details, autosave: true, class_name: "HouseDetails", as: :house
  attr_accessible :apartment_house_details
  auto_build :apartment_house_details





  delegate_with_setter *(HouseDetails.details_attribute_names), to: :apartment_house_details, allow_nil: true

  def styles
    {
        avatar: "400x200"
    }
  end

end
