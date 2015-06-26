class Address < ActiveRecord::Base
  attr_accessible(*attribute_names)


  belongs_to :addressable, polymorphic: true, foreign_key: :addressable_id
  attr_accessible :addressable

  def full_address
    res = "#{city}, #{country}, #{index}. #{street}"
    if house_number
      res += ", #{house_number}"

      if apartment_number
        res += "/#{apartment_number}"
      end
    end

    res


  end
end
