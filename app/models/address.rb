class Address < ActiveRecord::Base
  attr_accessible(*attribute_names)


  belongs_to :addressable, polymorphic: true, foreign_key: :addressable_id
  attr_accessible :addressable



  def full_address
    field_names = [:city, :country, :index, :street, :house_number, :apartment_number]

    fields_hash = Hash[field_names.collect { |v| [v, send(v)] }]
    if addressable.respond_to?(:parent) && (parent = addressable.parent) && parent.address
      fields_hash.each do |k, v|
        fields_hash[k] = parent.send(k)
      end
    end



    present_count = field_names.count
    fields_hash.each{|k, v| present_count -= 1 if v.blank? }
    if present_count == 0
      return nil
    end
    res = "#{fields_hash[:city]}, #{fields_hash[:country]}, #{fields_hash[:index]}. #{fields_hash[:street]}"


    if hn = fields_hash[:house_number]
      res += ", #{hn}"

      if an = fields_hash[:apartment_number]
        res += "/#{an}"
      end
    end

    res


  end
end
