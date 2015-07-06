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
