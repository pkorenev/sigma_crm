class ClientTagLink < ActiveRecord::Base
  self.table_name = :client_tags_link_table

  belongs_to :client
  belongs_to :client_tag, polymorphic: true


end