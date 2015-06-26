json.array!(@managers) do |manager|
  json.extract! manager, :id, :email, :full_name, :avatar, :full_address
  json.url manager_url(manager, format: :json)
end
