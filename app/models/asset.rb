# == Schema Information
#
# Table name: assets
#
#  id                :integer          not null, primary key
#  data_file_name    :string
#  data_content_type :string
#  data_file_size    :integer
#  data_updated_at   :datetime
#  assetable_type    :string
#  assetable_id      :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Asset < ActiveRecord::Base
  belongs_to :assetable, polymorphic: true

  has_attached_file :data,
                    :styles => { :thumb => "200x220#" },
                    :default_url => ApplicationController.helpers.asset_path('default-avatar.jpg')

  do_not_validate_attachment_file_type :data

  attr_accessible :data
end
