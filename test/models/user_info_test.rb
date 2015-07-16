# == Schema Information
#
# Table name: user_infos
#
#  birthday              :date
#  created_at            :datetime         not null
#  first_name            :string
#  id                    :integer          not null, primary key
#  identification_number :string
#  last_name             :string
#  middle_name           :string
#  phone                 :string
#  updated_at            :datetime         not null
#  user_id               :integer
#  user_type             :string
#

require 'test_helper'

class UserInfoTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
