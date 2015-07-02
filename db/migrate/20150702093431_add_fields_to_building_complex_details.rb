class AddFieldsToBuildingComplexDetails < ActiveRecord::Migration
  def change
    add_column :building_complex_details, :price_per_meter, :integer
    add_column :building_complex_details, :price_per_meter_currency, :string
    add_column :building_complex_details, :building_start_date, :date
    add_column :building_complex_details, :estimated_building_end_date, :date
    add_column :building_complex_details, :main_purpose, :string
    add_column :building_complex_details, :commercial_premises, :string
    add_column :building_complex_details, :levels_count, :integer
    add_column :building_complex_details, :apartments_count, :integer
    add_column :building_complex_details, :sections_count, :integer
    add_column :building_complex_details, :construction_description, :text
    add_column :building_complex_details, :construction_material_text, :text
    add_column :building_complex_details, :exterior_walls_description, :text
    add_column :building_complex_details, :insulation_type_description, :text
    add_column :building_complex_details, :fasade_description, :text
    add_column :building_complex_details, :windows_description, :text
    add_column :building_complex_details, :parking_type_description, :text
    add_column :building_complex_details, :roof_structure, :text
    add_column :building_complex_details, :level_height, :float
    add_column :building_complex_details, :heating_type, :text
    add_column :building_complex_details, :lifts_count, :integer
    add_column :building_complex_details, :additional_description, :text
  end
end
