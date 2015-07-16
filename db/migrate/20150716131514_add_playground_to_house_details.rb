class AddPlaygroundToHouseDetails < ActiveRecord::Migration
  def change
    add_column :house_details, :playground, :text
  end
end
