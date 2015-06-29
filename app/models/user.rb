class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :invitable#, :authentication_keys => {email: true, get_phone: false}

  #include DeviseTokenAuth::Concerns::User
  include UserConcern

  rolify

  attr_accessible(*attribute_names)

  has_one :user_info, as: :user
  accepts_nested_attributes_for :user_info

  attr_accessible :user_info, :user_info_attributes

  attr_accessible :password, :password_confirmation, :email
  delegate :first_name, :last_name, :middle_name, :identification_number, :phone, :user_type, :user_id, :full_name, :address, :full_address, :avatar, to: :user_info, allow_nil: true

  has_many :comments
  accepts_nested_attributes_for :comments
  attr_accessible :comments, :comments_attributes

  attr_accessible :remember_me

  has_many :building_views
  has_many :viewed_buildings, through: :building_views, source: :building




  # def self.find_for_database_authentication(warden_conditions)
  #   conditions = warden_conditions.dup
  #   if login = conditions.delete(:get_phone)
  #     #where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
  #     #return Admin.where('id > 0').limit(1)
  #     return Admin.first
  #   else
  #     #where(conditions.to_h).first
  #     return Admin.second
  #   end
  # end

  validates :email, presence: true

  def self.find_for_database_authentication(warden_conditions)
    #return Admin.first
    #return nil


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
