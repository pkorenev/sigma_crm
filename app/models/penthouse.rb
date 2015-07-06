class Penthouse < Building
  has_one :apartment_info, as: :building
  has_one :penthouse_details

  delegate_with_setter :square, to: :apartment_info, allow_nil: true
end