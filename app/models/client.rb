class Client < User
  has_and_belongs_to_many :client_tags, join_table: :client_tags_link_table
end