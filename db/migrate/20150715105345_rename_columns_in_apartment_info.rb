class RenameColumnsInApartmentInfo < ActiveRecord::Migration
  def change
    rename_column :apartment_infos, :appartment_separator_walls_description, :apartment_separator_walls_description
    rename_column :apartment_infos, :appartment_inner_separator_walls_description, :apartment_inner_separator_walls_description
  end
end
