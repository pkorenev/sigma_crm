class CreateBuildings < ActiveRecord::Migration
  def change
    create_table :buildings do |t|
      t.string :type
      t.integer :price
      t.string :price_currency
      t.string :status

      t.string :parent_type
      t.integer :parent_id


      t.timestamps null: false
    end
  end
end
