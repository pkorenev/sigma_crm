class Agreement < ActiveRecord::Base
  belongs_to :building
  belongs_to :client
end
