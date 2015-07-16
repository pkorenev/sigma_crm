# == Schema Information
#
# Table name: building_views
#
#  building_id :integer
#  created_at  :datetime         not null
#  id          :integer          not null, primary key
#  starred     :boolean
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'test_helper'

class BuildingViewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
