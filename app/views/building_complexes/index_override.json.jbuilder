json.array!(@building_complexes) do |building_complex|
  json.extract! building_complex, :id
  json.url building_complex_url(building_complex, format: :json)
end
