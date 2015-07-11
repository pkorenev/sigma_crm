# == Schema Information
#
# Table name: building_complex_links
#
#  id                    :integer          not null, primary key
#  building_id           :integer
#  building_type         :string
#  building_complex_id   :integer
#  building_complex_type :string
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class BuildingComplexLink < ActiveRecord::Base
  belongs_to :building_complex
  belongs_to :building
end
