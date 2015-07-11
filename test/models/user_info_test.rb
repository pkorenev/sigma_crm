# == Schema Information
#
# Table name: user_infos
#
#  id                    :integer          not null, primary key
#  first_name            :string
#  last_name             :string
#  middle_name           :string
#  identification_number :string
#  phone                 :string
#  birthday              :date
#  user_type             :string
#  user_id               :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

require 'test_helper'

class UserInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
