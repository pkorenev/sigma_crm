class Comment < ActiveRecord::Base
  attr_accessible(*attribute_names)

  belongs_to :comment_author, class_name: "User"
  belongs_to :commentable, polymorphic: true
  attr_accessible :commentable

  has_many :comments, class_name: "Comment", as: :commentable
  accepts_nested_attributes_for :comments
  attr_accessible :comments, :comments_attributes

  has_many :assets, as: :assetable
end
