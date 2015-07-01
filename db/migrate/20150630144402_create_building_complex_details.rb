class CreateBuildingComplexDetails < ActiveRecord::Migration
  def change
    create_table :building_complex_details do |t|
      t.string :name
      t.belongs_to :building_complex

      t.timestamps null: false
    end
  end
end
