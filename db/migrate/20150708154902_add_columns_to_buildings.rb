class AddColumnsToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :full_description, :text
  end
end
