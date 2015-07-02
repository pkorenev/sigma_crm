class HouseDetails < ActiveRecord::Base
  attr_accessible *attribute_names

  belongs_to :house, polymorphic: true, autosave: true
  attr_accessible :house

  #after_commit { building_complex.read(self) }



end
