class GeneralizeBuildingComplexDetailsToHouseDetails < ActiveRecord::Migration
  def change
    # create_table :generalize_building_complex_details_to_house_details do |t|
    #
    #   t.timestamps null: false
    # end

    rename_table :building_complex_details, :house_details
    add_column :house_details, :house_type, :string
    rename_column :house_details, :building_complex_id, :house_id
  end
end
