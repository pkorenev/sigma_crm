class AddClientTagTypeToClientTagLinks < ActiveRecord::Migration
  def change
    add_column :client_tags_link_table, :client_tag_type, :string
  end
end
