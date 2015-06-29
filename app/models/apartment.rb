class Apartment < Building
  has_one :apartment_info, as: :building

  has_one :apartment_details
end
