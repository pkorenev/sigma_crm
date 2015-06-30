class ApartmentDetails < ActiveRecord::Base
  belongs_to :apartment
  attr_accessible(*attribute_names)
  attr_accessible :apartment

end
