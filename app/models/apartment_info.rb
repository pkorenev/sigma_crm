# == Schema Information
#
# Table name: apartment_infos
#
#  additional_info                             :text
#  apartment_inner_separator_walls_description :text
#  apartment_separator_walls_description       :text
#  apartment_type                              :string
#  beautification_description                  :text
#  building_code_number                        :integer
#  building_id                                 :integer
#  building_type                               :string
#  created_at                                  :datetime         not null
#  exterior_walls_description                  :text
#  filling_openings_in_walls_description       :text
#  heating_description                         :text
#  height_description                          :text
#  id                                          :integer          not null, primary key
#  internal_finishing_work_description         :text
#  internal_sewer_system_description           :text
#  internet_description                        :text
#  kitchen_stove_description                   :text
#  live_square                                 :float
#  meters_description                          :text
#  phone_description                           :text
#  plumbing_description                        :text
#  rooms_count                                 :integer
#  section_number                              :integer
#  square                                      :float
#  state                                       :text
#  total_square                                :float
#  tv_description                              :text
#  updated_at                                  :datetime         not null
#  ventilation_description                     :text
#  water_supply_description                    :text
#  wiring_description                          :text
#

class ApartmentInfo < ActiveRecord::Base
  attr_accessible(*attribute_names)

  belongs_to :building, polymorphic: true

  def self.descriptive_attribute_names
    attribute_names.select{|a| a.scan(/_description\Z/).count > 0 }.map(&:to_sym)
  end

  def self.form_attribute_names
    [:exterior_walls_description, :apartment_separator_walls_description, :apartment_inner_separator_walls_description, :height_description, :filling_openings_in_walls_description, :phone_description, :internet_description, :tv_description, :kitchen_stove_description, :wiring_description, :plumbing_description, :heating_description, :ventilation_description, :water_supply_description, :meters_description, :internal_sewer_system_description, :internal_finishing_work_description, :beautification_description, :additional_info, :square, :rooms_count, :state, :total_square, :live_square, :building_code_number, :apartment_type]
  end


end
