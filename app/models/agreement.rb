# == Schema Information
#
# Table name: agreements
#
#  building_id  :integer
#  client_id    :integer
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  manager_id   :integer
#  manager_type :string
#  set_at       :datetime
#  updated_at   :datetime         not null
#

class Agreement < ActiveRecord::Base
  belongs_to :building
  belongs_to :client
end
