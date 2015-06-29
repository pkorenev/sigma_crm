class BuildingComplexLink < ActiveRecord::Base
  belongs_to :building_complex
  belongs_to :building
end
