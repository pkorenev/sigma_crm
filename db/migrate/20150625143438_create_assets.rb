class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.has_attached_file :data
      t.string :assetable_type
      t.integer :assetable_id

      t.timestamps null: false
    end
  end
end
