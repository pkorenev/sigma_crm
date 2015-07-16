# == Schema Information
#
# Table name: house_details
#
#  additional_description             :text
#  apartments_count                   :integer
#  building_start_date                :date
#  building_start_date_string         :string
#  commercial_premises                :string
#  construction_description           :text
#  construction_material_text         :text
#  created_at                         :datetime         not null
#  estimated_building_end_date        :date
#  estimated_building_end_date_string :string
#  exterior_walls_description         :text
#  facade_description                 :text
#  heating_type                       :text
#  house_id                           :integer
#  house_type                         :string
#  id                                 :integer          not null, primary key
#  insulation_type_description        :text
#  level_height                       :float
#  levels_count                       :integer
#  lifts_count                        :integer
#  main_purpose                       :string
#  name                               :string
#  parking_type_description           :text
#  presence_string                    :string
#  price_per_meter                    :integer
#  price_per_meter_currency           :string
#  roof_structure                     :text
#  sections_count                     :integer
#  updated_at                         :datetime         not null
#  windows_description                :text
#

class HouseDetails < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :house, polymorphic: true, autosave: true
  attr_accessible :house

  #after_commit { building_complex.read(self) }

  def self.details_attribute_names
    [:price_per_meter, :price_per_meter_currency, :building_start_date_string, :estimated_building_end_date, :main_purpose, :commercial_premises, :levels_count, :apartments_count, :sections_count, :construction_description, :construction_material_text, :exterior_walls_description, :insulation_type_description, :facade_description, :windows_description, :parking_type_description, :roof_structure, :level_height, :heating_type, :lifts_count, :additional_description, :presence_string, :estimated_building_end_date_string, :playground]
  end

end
