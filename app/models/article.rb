class Article < ActiveRecord::Base
  has_many :assets, as: :assetable
  has_attached_file :image
end
