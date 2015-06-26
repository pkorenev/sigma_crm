class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable

  rolify

  attr_accessible(*attribute_names)

  has_one :user_info, as: :user
  accepts_nested_attributes_for :user_info

  attr_accessible :user_info, :user_info_attributes

  attr_accessible :password, :password_confirmation, :email
  delegate :first_name, :last_name, :middle_name, :identification_number, :phone, :user_type, :user_id, :full_name, :address, :full_address, :avatar, to: :user_info

  has_many :comments
  accepts_nested_attributes_for :comments
  attr_accessible :comments, :comments_attributes

  attr_accessible :remember_me
end
