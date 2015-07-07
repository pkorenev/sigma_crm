class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.text :content
      t.string :name
      t.has_attached_file :image

      t.timestamps null: false
    end
  end
end
