class ApartmentHouse < Building
  has_one :apartment_house_details, autosave: true, class_name: "HouseDetails", as: :house
  attr_accessible :apartment_house_details
  auto_build :apartment_house_details





  delegate_with_setter *(HouseDetails.details_attribute_names), to: :apartment_house_details, allow_nil: true

  def styles
    {
        avatar: "400x200"
    }
  end

end