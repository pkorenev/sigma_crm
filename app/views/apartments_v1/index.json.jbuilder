json.array!(@apartments) do |apartment|
  json.extract! apartment, :id, :rooms_count, :square
  json.url apartment_url(apartment, format: :json)
end
