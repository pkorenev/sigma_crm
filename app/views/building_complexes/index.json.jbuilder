json.array!(@buildings) do |building|
  json.extract! building, :id, :type, :price, :price_currency, :name, :country, :city
  json.url building_url(building, format: :json)
end
