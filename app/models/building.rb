class Building < ActiveRecord::Base
  has_one :address, as: :addressable
  has_many :assets, as: :assetable

  accepts_nested_attributes_for :address
  accepts_nested_attributes_for :assets
  attr_accessible :address, :address_attributes
  attr_accessible :assets, :assets_attributes

  has_many :comments, as: :commentable
  accepts_nested_attributes_for :comments
  attr_accessible :comments, :comments_attributes

  belongs_to :parent, polymorphic: true, foreign_key: :parent_id
  has_many :children, class_name: "Building", as: :parent


  delegate :street, :house_number, :apartment_number, :index, :city, :country, :full_address, to: :address

  before_save :set_defaults
  def set_defaults
    if published.nil?
      published = false
    end
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
