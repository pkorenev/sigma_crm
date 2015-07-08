# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  invitation_token       :string
#  invitation_created_at  :datetime
#  invitation_sent_at     :datetime
#  invitation_accepted_at :datetime
#  invitation_limit       :integer
#  invited_by_id          :integer
#  invited_by_type        :string
#  type                   :string
#  provider               :string           default(""), not null
#  uid                    :string           default(""), not null
#  tokens                 :text
#

class User < ActiveRecord::Base

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
  methods_to_delegate = [:first_name, :last_name, :middle_name, :identification_number, :phone, :user_type, :user_id, :full_name, :address, :country, :city, :full_address, :avatar]

  delegate_with_setter *methods_to_delegate, to: :user_info, allow_nil: true


  accepts_nested_attributes_for :comments
  attr_accessible :comments, :comments_attributes



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
