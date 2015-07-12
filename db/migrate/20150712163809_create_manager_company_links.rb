class CreateManagerCompanyLinks < ActiveRecord::Migration
  def change
    create_table :manager_company_links do |t|
      t.belongs_to :manager, index: true, foreign_key: true
      t.belongs_to :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
