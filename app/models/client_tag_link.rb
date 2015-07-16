# == Schema Information
#
# Table name: client_tags_link_table
#
#  client_id       :integer
#  client_tag_id   :integer
#  client_tag_type :string
#  id              :integer          not null, primary key
#

class ClientTagLink < ActiveRecord::Base
  self.table_name = :client_tags_link_table

  belongs_to :client
  belongs_to :client_tag, polymorphic: true


end
