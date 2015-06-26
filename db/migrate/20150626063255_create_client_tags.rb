class CreateClientTags < ActiveRecord::Migration
  def change
    create_table :client_tags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
