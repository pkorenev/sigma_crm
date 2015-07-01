class BuildingComplexDetails < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :building_complex, autosave: true
  attr_accessible :building_complex

  #after_commit { building_complex.read(self) }

end
