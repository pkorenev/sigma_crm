class AddCoordinatesToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :latitude, :float
    add_column :addresses, :longitude, :float

    remove_column :house_details, :latitude
    remove_column :house_details, :longitude
  end
end
