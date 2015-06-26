class CreateClientTagsLinkTable < ActiveRecord::Migration
  def change
    create_table :client_tags_link_table do |t|
      t.belongs_to :client
      t.belongs_to :client_tag
    end
  end
end
