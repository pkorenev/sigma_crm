class AddProfileStatusToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_status, :string
  end
end
