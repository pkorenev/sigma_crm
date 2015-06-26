class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street
      t.integer :house_number
      t.integer :apartment_number
      t.integer :index
      t.string :city
      t.string :country
      t.integer :addressable_id
      t.string :addressable_type

      t.timestamps null: false
    end
  end
end
