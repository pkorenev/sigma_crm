json.array!(@resources) do |building|
  json.extract! building, :id, :type, :price, :price_currency, *(HouseDetails.details_attribute_names), :city, :country, :street
end
