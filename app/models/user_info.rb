# == Schema Information
#
# Table name: user_infos
#
#  id                    :integer          not null, primary key
#  first_name            :string
#  last_name             :string
#  middle_name           :string
#  identification_number :string
#  phone                 :string
#  birthday              :date
#  user_type             :string
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class UserInfo < ActiveRecord::Base
  #include Resource
  belongs_to :user, polymorphic: true
  has_many :assets, as: :assetable

  attr_accessible(*attribute_names)

  attr_accessible :user

  def full_name
    "#{last_name} #{first_name} #{middle_name}"
  end

  has_one :address, as: :addressable
  accepts_nested_attributes_for :address
  attr_accessible :address, :address_attributes

  delegate_with_setter :street, :house_number, :apartment_number, :index, :city, :country, :full_address, to: :address, allow_nil: true

  auto_build :address
end
