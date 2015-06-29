class CreatePenthouseDetails < ActiveRecord::Migration
  def change
    create_table :penthouse_details do |t|
      t.integer :levels
      t.belongs_to :penthouse

      t.timestamps null: false
    end
  end
end
