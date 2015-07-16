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

class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data,
                    :url  => "/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :path => ":rails_root/public/ckeditor_assets/pictures/:id/:style_:basename.:extension",
                    :styles => { :content => '800>', :thumb => '118x100#' }

  validates_attachment_presence :data
  validates_attachment_size :data, :less_than => 2.megabytes
  validates_attachment_content_type :data, :content_type => /\Aimage/

  def url_content
    url(:content)
  end
end
