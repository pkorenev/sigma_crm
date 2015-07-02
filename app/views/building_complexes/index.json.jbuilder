json.array!(resources_instance_variable) do |building|
  json.extract! building, :id, :type, :price, :price_currency, :name, *(BuildingComplex.details_attribute_names)
end
