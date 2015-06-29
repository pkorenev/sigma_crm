class ManagerClientLink < ActiveRecord::Base
  belongs_to :client
  belongs_to :manager
end
