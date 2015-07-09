json.extract! @resource, :id, :type, :price, :price_currency, :created_at, :updated_at, :name, *(HouseDetails.details_attribute_names), :full_description
json.avatar_url @resource.avatar.url
json.avatar_exists @resource.avatar.exists?
