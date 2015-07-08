# == Schema Information
#
# Table name: building_views
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  building_id :integer
#  starred     :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class BuildingView < ActiveRecord::Base
  belongs_to :user
  belongs_to :building
end
