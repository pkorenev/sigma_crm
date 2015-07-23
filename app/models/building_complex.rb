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

class BuildingComplex < Building
  has_many :building_complex_links

  has_many :buildings, through: :building_complex_links

  has_one :building_complex_details, autosave: true, class_name: "HouseDetails", as: :house
  attr_accessible :building_complex_details
  auto_build :building_complex_details





  delegate_with_setter :name, *(HouseDetails.details_attribute_names), to: :building_complex_details, allow_nil: true



  #belongs_to :parent, polymorphic: true, foreign_key: :parent_id, class_name: "Building"
  has_many :children, as: :parent, class_name: "Building"
  has_many :apartment_houses, foreign_key: :parent_id

  

  [:apartments, :apartment_houses, :penthouses].each do |attr|
    if attr.to_s.plural?
      #has_many attr, -> { where( type: attr.to_s.singularize.classify ) }, through: :building_complex_links, source: :building
    end
  end

  def self.path_name(action, *args)
    resource_class_name = self.class.name.underscore
    p = "#{action}_#{resource_class_name}_path"
    return p
  end

  def url_helpers
    @_url_helpers ||= Rails.application.routes.url_helpers
  end

  # def apartments
  #   buildings.where(type: "Apartment")
  #   ActiveRecord::Associations::CollectionProxy
  # end

  def to_s
    name
  end

  def self.details_attribute_names
    HouseDetails.details_attribute_names
  end


end

#
#
#
