class Asset < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true

  has_attached_file :data#, STYLES: :method

  attr_accessible :data
  #
  # def method
  #   assetable.styles
  # end
end
