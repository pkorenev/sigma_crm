# == Schema Information
#
# Table name: user_infos
#
#  birthday              :date
#  created_at            :datetime         not null
#  first_name            :string
#  id                    :integer          not null, primary key
#  identification_number :string
#  last_name             :string
#  middle_name           :string
#  phone                 :string
#  updated_at            :datetime         not null
#  user_id               :integer
#  user_type             :string
#

class UserInfo < ActiveRecord::Base
  #include Resource
  belongs_to :user, polymorphic: true

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

  def avatar_url
    assets.first.try{|a| return a.data.url if a.data.exists?; return nil } || "/assets/img.jpg"
  end


end
