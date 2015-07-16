class AddFieldsToApartmentInfo < ActiveRecord::Migration
  def change
    add_column :apartment_infos, :rooms_count, :integer
    add_column :apartment_infos, :state, :text
    add_column :apartment_infos, :section_number, :integer
    add_column :apartment_infos, :total_square, :float
    add_column :apartment_infos, :live_square, :float
    add_column :apartment_infos, :building_code_number, :integer
  end
end
