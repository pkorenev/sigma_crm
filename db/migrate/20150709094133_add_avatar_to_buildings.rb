class AddAvatarToBuildings < ActiveRecord::Migration
  def change
    add_column :buildings, :avatar_file_name, :string
    add_column :buildings, :avatar_file_size, :integer
    add_column :buildings, :avatar_content_type, :string
    add_column :buildings, :avatar_updated_at, :datetime
  end
end
