# == Schema Information
#
# Table name: buildings
#
#  id             :integer          not null, primary key
#  type           :string
#  price          :integer
#  price_currency :string
#  status         :string
#  parent_type    :string
#  parent_id      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  published      :boolean
#

require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
