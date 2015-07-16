# == Schema Information
#
# Table name: building_complex_links
#
#  building_complex_id   :integer
#  building_complex_type :string
#  building_id           :integer
#  building_type         :string
#  created_at            :datetime         not null
#  id                    :integer          not null, primary key
#  updated_at            :datetime         not null
#

class BuildingComplexLink < ActiveRecord::Base
  belongs_to :building_complex
  belongs_to :building
end
