# == Schema Information
#
# Table name: buildings
#
#  id             :integer          not null, primary key
#  type           :string
#  price          :integer
#  price_currency :string
#  status         :string
#  parent_type    :string
#  parent_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  published      :boolean
#

class Penthouse < Building
  has_one :apartment_info, as: :building
  has_one :penthouse_details

  delegate_with_setter :square, to: :apartment_info, allow_nil: true
end
