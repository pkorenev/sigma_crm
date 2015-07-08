# == Schema Information
#
# Table name: house_details
#
#  id                          :integer          not null, primary key
#  name                        :string
#  house_id                    :integer
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  price_per_meter             :integer
#  price_per_meter_currency    :string
#  building_start_date         :date
#  estimated_building_end_date :date
#  main_purpose                :string
#  commercial_premises         :string
#  levels_count                :integer
#  apartments_count            :integer
#  sections_count              :integer
#  construction_description    :text
#  construction_material_text  :text
#  exterior_walls_description  :text
#  insulation_type_description :text
#  fasade_description          :text
#  windows_description         :text
#  parking_type_description    :text
#  roof_structure              :text
#  level_height                :float
#  heating_type                :text
#  lifts_count                 :integer
#  additional_description      :text
#  house_type                  :string
#

class HouseDetails < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :house, polymorphic: true, autosave: true
  attr_accessible :house

  #after_commit { building_complex.read(self) }



end
