class AddFieldsToHouseDetails < ActiveRecord::Migration
  def change
    add_column :house_details, :presence_string, :string
    add_column :house_details, :estimated_building_end_date_string, :string
    add_column :house_details, :latitude, :string
    add_column :house_details, :longitude, :string
  end
end
