# == Schema Information
#
# Table name: apartment_details
#
#  apartment_id :integer
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  level        :integer
#  updated_at   :datetime         not null
#

class ApartmentDetails < ActiveRecord::Base
  belongs_to :apartment
  attr_accessible(*attribute_names)
  attr_accessible :apartment

  def self.descriptive_attribute_names
    attribute_names.select{|a| !a.to_s.in?(%(id)) && a.to_s.scan(/_id\Z/).length == 0 }
  end

end
