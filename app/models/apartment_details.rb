# == Schema Information
#
# Table name: apartment_details
#
#  id           :integer          not null, primary key
#  level        :integer
#  apartment_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ApartmentDetails < ActiveRecord::Base
  belongs_to :apartment
  attr_accessible(*attribute_names)
  attr_accessible :apartment

end
