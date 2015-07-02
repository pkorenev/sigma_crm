json.array!(resources_instance_variable) do |building|
  json.extract! building, :id, :type, :price, :price_currency, :name, *(ApartmentHouse.details_attribute_names), :city, :country, :street
end
