# == Schema Information
#
# Table name: assets
#
#  assetable_id      :integer
#  assetable_type    :string
#  created_at        :datetime         not null
#  data_content_type :string
#  data_file_name    :string
#  data_file_size    :integer
#  data_updated_at   :datetime
#  id                :integer          not null, primary key
#  updated_at        :datetime         not null
#

require 'test_helper'

class AssetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
