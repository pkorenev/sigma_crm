class SchemeController < ApplicationController
  def house_details_attributes
    fields = BuildingComplex.details_attribute_names.map do |attr_name|
      h = {}
      h[attr_name.to_sym] = {type: "input", key: attr_name, templateOptions: { type: "text", label: attr_name.to_s.humanize }}
    end

    render json: fields
  end
end