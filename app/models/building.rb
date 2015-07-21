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

class Building < ActiveRecord::Base
  attr_accessible *attribute_names
  has_one :address, as: :addressable, autosave: true
  has_many :assets, as: :assetable

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :assets
  attr_accessible :address, :address_attributes
  attr_accessible :assets, :assets_attributes

  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments
  attr_accessible :comments, :comments_attributes



  has_one :building_complex_link
  has_one :building_complex, through: :building_complex_link


  delegate_with_setter *Address.form_fields, to: :address, allow_nil: true
  delegate :full_address, to: :address, allow_nil: true

  has_many :user_views, class_name: "BuildingView"
  has_many :users_viewed, through: :user_views, source: :building

  has_attached_file :avatar
  attr_accessible :avatar
  do_not_validate_attachment_file_type :avatar

  #belongs_to :parent

  auto_build :address

  before_save :set_defaults
  def set_defaults
    if published.nil?
      published = false
    end

    return true
  end

  scope :published, -> { where(published: 't') }
  scope :available_for_manager, -> { published }
  scope :available_for_user, ->(user) {
    if user
      if user.instance_of?(Manager)
        return available_for_manager
      end
    else
      if user.instance_of?(Admin)
        return all
      end
    end
  }
end
# rails g model UserAttribute attributtable_type:string attributtable_id:integer attribute_name:string attribute_type:string required:boolean
