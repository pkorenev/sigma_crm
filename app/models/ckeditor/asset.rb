# == Schema Information
#
# Table name: ckeditor_assets
#
#  assetable_id      :integer
#  assetable_type    :string(30)
#  created_at        :datetime
#  data_content_type :string
#  data_file_name    :string           not null
#  data_file_size    :integer
#  height            :integer
#  id                :integer          not null, primary key
#  type              :string(30)
#  updated_at        :datetime
#  width             :integer
#

class Ckeditor::Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip
end
