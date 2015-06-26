class ClientTag < ActiveRecord::Base
  has_and_belongs_to_many :clients, join_table: :client_tags_link_table
end
