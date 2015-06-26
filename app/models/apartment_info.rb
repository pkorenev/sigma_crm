class ApartmentInfo < ActiveRecord::Base
  attr_accessible(*attribute_names)

  belongs_to :building, polymorphic: true

  def self.descriptive_attribute_names
    attribute_names.select{|a| a.scan(/_description\Z/).count > 0 }.map(&:to_sym)
  end


end
