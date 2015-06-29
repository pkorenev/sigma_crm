class CreateBuildingComplexLinks < ActiveRecord::Migration
  def change
    create_table :building_complex_links do |t|
      t.integer :building_id
      t.string :building_type
      t.integer :building_comnplex_id
      t.string :building_complex_type

      t.timestamps null: false
    end
  end
end
