class AddPublishedToBuilding < ActiveRecord::Migration
  def change
    add_column :buildings, :published, :boolean
  end
end
