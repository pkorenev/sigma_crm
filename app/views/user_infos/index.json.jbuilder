json.array!(@user_infos) do |user_info|
  json.extract! user_info, :id, :first_name, :last_name, :middle_name, :identification_number, :phone, :email, :user_type, :user_id
  json.url user_info_url(user_info, format: :json)
end
