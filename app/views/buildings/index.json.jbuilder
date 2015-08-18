json.array!(@resources) do |building|
  json.extract! building, :id, :type, :price, :price_currency
  #json.url building_url(building, format: :json)
end
