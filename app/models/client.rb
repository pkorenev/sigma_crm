class Client < User
  has_and_belongs_to_many :client_status_tags, join_table: :client_tags_link_table

  has_and_belongs_to_many :client_group_tags, join_table: :client_tags_link_table

  has_one :manager_client_link
  has_one :manager, through: :manager_client_link





end