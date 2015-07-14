class AddBuildingStartDateToHouseDetails < ActiveRecord::Migration
  def change
    add_column :house_details, :building_start_date_string, :string
  end
end
