# == Schema Information
#
# Table name: users
#
#  created_at             :datetime         not null
#  current_sign_in_at     :datetime
#  current_sign_in_ip     :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  id                     :integer          not null, primary key
#  invitation_accepted_at :datetime
#  invitation_created_at  :datetime
#  invitation_limit       :integer
#  invitation_sent_at     :datetime
#  invitation_token       :string
#  invited_by_id          :integer
#  invited_by_type        :string
#  last_sign_in_at        :datetime
#  last_sign_in_ip        :string
#  profile_status         :string
#  provider               :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  sign_in_count          :integer          default(0), not null
#  tokens                 :text
#  type                   :string
#  uid                    :string           default(""), not null
#  updated_at             :datetime         not null
#

class User < ActiveRecord::Base
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable#, :authentication_keys => {email: true, get_phone: false}

  #include DeviseTokenAuth::Concerns::User
  #include UserConcern

  rolify

  attr_accessible(*attribute_names)

  has_one :user_info, as: :user
  has_many :building_views
  has_many :viewed_buildings, through: :building_views, source: :building
  has_many :comments


  accepts_nested_attributes_for :user_info
  attr_accessible :user_info, :user_info_attributes

  attr_accessible :password, :password_confirmation, :email
  methods_to_delegate = [:first_name, :last_name, :middle_name, :identification_number, :phone, :user_type, :user_id, :full_name, :address, :country, :city, :full_address, :avatar, :birthday]

  delegate_with_setter *methods_to_delegate, to: :user_info, allow_nil: true


  accepts_nested_attributes_for :comments
  attr_accessible :comments, :comments_attributes


  enumerize :profile_status, in: [:filled, :unfilled], default: :unfilled


  auto_build :user_info



  validates :email, presence: true

  def self.find_for_database_authentication(warden_conditions)

    email = warden_conditions[:email]
    user = where("email = '#{email}'").first
    if !user
      user = joins(:user_info).where(user_infos: {phone: email}).first
    end

    user
  end

  def get_phone
    if user_info && (p = phone) && p.present?
      return p
    else
      return nil
    end
  end


end
