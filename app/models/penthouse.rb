class Penthouse < Building
  has_one :apartment_info, as: :building
  has_one :penthouse_details
end