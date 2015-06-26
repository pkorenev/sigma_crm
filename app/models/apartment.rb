class Apartment < Building
  has_one :apartment_info, as: :building
end
