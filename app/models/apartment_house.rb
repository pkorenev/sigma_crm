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


  belongs_to :parent, polymorphic: true, foreign_key: :parent_id, class_name: "Building"
  has_many :children, class_name: "Building", as: :parent


  delegate_with_setter *(HouseDetails.details_attribute_names), to: :apartment_house_details, allow_nil: true

  def styles
    {
        avatar: "400x200"
    }
  end

end
