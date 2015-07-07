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

  has_attached_file :avatar

  auto_build :address
end
