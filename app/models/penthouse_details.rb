# == Schema Information
#
# Table name: penthouse_details
#
#  created_at   :datetime         not null
#  id           :integer          not null, primary key
#  levels       :integer
#  penthouse_id :integer
#  updated_at   :datetime         not null
#

class PenthouseDetails < ActiveRecord::Base
  belongs_to :penthouse
end
