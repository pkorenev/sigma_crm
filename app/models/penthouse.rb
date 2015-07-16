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

class Penthouse < Building
  has_one :apartment_info, as: :building
  has_one :penthouse_details

  delegate_with_setter :square, to: :apartment_info, allow_nil: true

  belongs_to :parent, polymorphic: true, foreign_key: :parent_id, class_name: "Building"
  #has_many :children, class_name: "Building", as: :parent
end
