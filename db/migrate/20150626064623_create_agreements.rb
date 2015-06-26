class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.belongs_to :building, index: true, foreign_key: true
      t.belongs_to :client, index: true, foreign_key: true
      t.string :manager_type
      t.integer :manager_id
      t.datetime :set_at

      t.timestamps null: false
    end
  end
end
