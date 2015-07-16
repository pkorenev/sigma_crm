# == Schema Information
#
# Table name: buildings
#
#  avatar_content_type :string
#  avatar_file_name    :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime         not null
#  full_description    :text
#  id                  :integer          not null, primary key
#  parent_id           :integer
#  parent_type         :string
#  price               :integer
#  price_currency      :string
#  published           :boolean
#  status              :string
#  type                :string
#  updated_at          :datetime         not null
#

require 'test_helper'

class ApartmentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
