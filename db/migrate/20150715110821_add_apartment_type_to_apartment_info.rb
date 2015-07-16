class AddApartmentTypeToApartmentInfo < ActiveRecord::Migration
  def change
    add_column :apartment_infos, :apartment_type, :string
  end
end
