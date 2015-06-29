class CreateApartmentDetails < ActiveRecord::Migration
  def change
    create_table :apartment_details do |t|
      t.integer :level
      t.belongs_to :apartment

      t.timestamps null: false
    end
  end
end
