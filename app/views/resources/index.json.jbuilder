json.array!(@resources) do |resource|
  json.extract! resource, *(resource.class.attribute_names)
  #json.url client_url(resource, format: :json)
end
