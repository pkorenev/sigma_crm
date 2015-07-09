json.array!(@resources) do |resource|
  json.extract! resource, *(resource.class.attribute_names)
  json.url resource.data.url
  json.thumb_url resource.data.url
end
