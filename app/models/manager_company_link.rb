class ManagerCompanyLink < ActiveRecord::Base
  belongs_to :manager
  belongs_to :company
end
