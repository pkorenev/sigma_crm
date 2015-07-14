class ApartmentDetails < ActiveRecord::Base
  belongs_to :apartment
  attr_accessible(*attribute_names)
  attr_accessible :apartment

  def self.descriptive_attribute_names
    attribute_names.select{|a| !a.to_s.in?(%(id)) && a.to_s.scan(/_id\Z/).length == 0 }
  end

end
