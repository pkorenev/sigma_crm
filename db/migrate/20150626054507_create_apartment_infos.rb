class CreateApartmentInfos < ActiveRecord::Migration
  def change
    create_table :apartment_infos do |t|
      t.text :exterior_walls_description
      t.text :appartment_separator_walls_description
      t.text :appartment_inner_separator_walls_description
      t.text :height_description
      t.text :filling_openings_in_walls_description
      t.text :phone_description
      t.text :internet_description
      t.text :tv_description
      t.text :kitchen_stove_description
      t.text :wiring_description
      t.text :plumbing_description
      t.text :heating_description
      t.text :ventilation_description
      t.text :water_supply_description
      t.text :meters_description
      t.text :internal_sewer_system_description
      t.text :internal_finishing_work_description
      t.text :beautification_description
      t.text :additional_info

      t.integer :building_id
      t.string :building_type

      t.timestamps null: false
    end
  end
end
