class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.text :comment_text
      t.belongs_to :comment_author, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
