# == Schema Information
#
# Table name: penthouse_details
#
#  id           :integer          not null, primary key
#  levels       :integer
#  penthouse_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PenthouseDetails < ActiveRecord::Base
  belongs_to :penthouse
end
