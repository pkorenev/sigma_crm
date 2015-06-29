class CreateBuildingViews < ActiveRecord::Migration
  def change
    create_table :building_views do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :building, index: true, foreign_key: true
      t.boolean :starred

      t.timestamps null: false
    end
  end
end
