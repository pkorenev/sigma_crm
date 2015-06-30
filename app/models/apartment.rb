class Apartment < Building
  has_one :apartment_info, as: :building

  has_one :apartment_details

  delegate :level, to: :apartment_details, allow_nil: true
end
