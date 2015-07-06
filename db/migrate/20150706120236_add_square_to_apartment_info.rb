class AddSquareToApartmentInfo < ActiveRecord::Migration
  def change
    add_column :apartment_infos, :square, :float
  end
end
