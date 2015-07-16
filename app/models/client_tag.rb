# == Schema Information
#
# Table name: client_tags
#
#  created_at :datetime         not null
#  id         :integer          not null, primary key
#  name       :string
#  type       :string
#  updated_at :datetime         not null
#

class ClientTag < ActiveRecord::Base
  has_and_belongs_to_many :clients, join_table: :client_tags_link_table
end
