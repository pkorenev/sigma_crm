json.array!(resources_instance_variable) do |building|
  json.extract! building, :id, :type, :price, :price_currency, *(BuildingComplex.details_attribute_names)
  #json.url building_url(building, format: :json)
end
