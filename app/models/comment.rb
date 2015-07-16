# == Schema Information
#
# Table name: comments
#
#  comment_author_id :integer
#  comment_text      :text
#  commentable_id    :integer
#  commentable_type  :string
#  created_at        :datetime         not null
#  id                :integer          not null, primary key
#  title             :string
#  updated_at        :datetime         not null
#

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
