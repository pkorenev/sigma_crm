# == Schema Information
#
# Table name: addresses
#
#  addressable_id           :integer
#  addressable_type         :string
#  apartment_number         :integer
#  city                     :string
#  country                  :string
#  created_at               :datetime         not null
#  district                 :string
#  google_formatted_address :string
#  google_place_id          :string
#  house_number             :integer
#  id                       :integer          not null, primary key
#  index                    :integer
#  latitude                 :float
#  longitude                :float
#  street                   :string
#  updated_at               :datetime         not null
#

require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
