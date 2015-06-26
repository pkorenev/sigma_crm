class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.string :identification_number
      t.string :phone
      t.date :birthday
      t.string :user_type
      t.integer :user_id



      t.timestamps null: false
    end
  end
end
