class Client < User
  has_many :client_tag_links
  #has_and_belongs_to_many :client_status_tags, join_table: :client_tags_link_table
  has_many :client_status_tags, through: :client_tag_links, source: :client_tag, source_type: "ClientStatusTag"
  has_many :client_group_tags, through: :client_tag_links, source: :client_tag, source_type: "ClientGroupTag"



  #has_many :client_group_tags, join_table: :client_tags_link_table

  has_many :manager_client_links
  has_many :managers, through: :manager_client_links





end