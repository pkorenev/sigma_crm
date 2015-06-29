class CreateManagerClientLinks < ActiveRecord::Migration
  def change
    create_table :manager_client_links do |t|
      t.belongs_to :client, index: true, foreign_key: true
      t.belongs_to :manager, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
