class RenameColumnsInHouseDetails < ActiveRecord::Migration
  def change
    rename_column :house_details, :fasade_description, :facade_description
  end
end
