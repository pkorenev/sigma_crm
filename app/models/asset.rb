class Asset < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true

  has_attached_file :data

  attr_accessible :data
end
