class AddTypeToClientTags < ActiveRecord::Migration
  def change
    add_column :client_tags, :type, :string
  end
end
