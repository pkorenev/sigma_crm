# == Schema Information
#
# Table name: apartment_infos
#
#  id                                           :integer          not null, primary key
#  exterior_walls_description                   :text
#  appartment_separator_walls_description       :text
#  appartment_inner_separator_walls_description :text
#  height_description                           :text
#  filling_openings_in_walls_description        :text
#  phone_description                            :text
#  internet_description                         :text
#  tv_description                               :text
#  kitchen_stove_description                    :text
#  wiring_description                           :text
#  plumbing_description                         :text
#  heating_description                          :text
#  ventilation_description                      :text
#  water_supply_description                     :text
#  meters_description                           :text
#  internal_sewer_system_description            :text
#  internal_finishing_work_description          :text
#  beautification_description                   :text
#  additional_info                              :text
#  building_id                                  :integer
#  building_type                                :string
#  created_at                                   :datetime         not null
#  updated_at                                   :datetime         not null
#  square                                       :float
#

class ApartmentInfo < ActiveRecord::Base
  attr_accessible(*attribute_names)

  belongs_to :building, polymorphic: true

  def self.descriptive_attribute_names
    attribute_names.select{|a| a.scan(/_description\Z/).count > 0 }.map(&:to_sym)
  end


end
