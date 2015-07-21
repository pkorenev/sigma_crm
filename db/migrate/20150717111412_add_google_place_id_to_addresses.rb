class AddGooglePlaceIdToAddresses < ActiveRecord::Migration
  def change
    add_column :addresses, :google_place_id, :string
  end
end
