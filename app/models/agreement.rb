# == Schema Information
#
# Table name: agreements
#
#  id           :integer          not null, primary key
#  building_id  :integer
#  client_id    :integer
#  manager_type :string
#  manager_id   :integer
#  set_at       :datetime
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Agreement < ActiveRecord::Base
  belongs_to :building
  belongs_to :client
end
