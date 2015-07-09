class Asset < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true

  has_attached_file :data#, STYLES: :method

  attr_accessible :data
  #
  # def method
  #   assetable.styles
  # end

  do_not_validate_attachment_file_type :data
end
