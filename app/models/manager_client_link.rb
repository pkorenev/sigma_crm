# == Schema Information
#
# Table name: manager_client_links
#
#  client_id  :integer
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  manager_id :integer
#  updated_at :datetime         not null
#

class ManagerClientLink < ActiveRecord::Base
  belongs_to :client
  belongs_to :manager
end
