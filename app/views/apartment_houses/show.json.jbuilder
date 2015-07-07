json.extract! resource_instance_variable, :id, :type, :price, :price_currency, :created_at, :updated_at, :name, *(HouseDetails.details_attribute_names)
