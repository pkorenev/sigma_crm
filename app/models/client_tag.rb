# == Schema Information
#
# Table name: client_tags
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  type       :string
#

class ClientTag < ActiveRecord::Base
  has_and_belongs_to_many :clients, join_table: :client_tags_link_table
end
