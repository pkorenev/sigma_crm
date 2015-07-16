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

require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
