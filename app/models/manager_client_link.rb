# == Schema Information
#
# Table name: manager_client_links
#
#  id         :integer          not null, primary key
#  client_id  :integer
#  manager_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ManagerClientLink < ActiveRecord::Base
  belongs_to :client
  belongs_to :manager
end
