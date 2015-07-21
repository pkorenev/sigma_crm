class BuildingComplexPresenter < BuildingContainerPresenter
  def form_address(required = true)
    content_tag :div, class: "group address" do
      content_tag(:h3, "Адреса") +
        content_tag(:div, class: "group-content") do
          form.input(:google_formatted_address, label: false, input_html: {id: "building_complex_address_autocomplete", class: "form-control address_autocomplete", placeholder: "Введіть адресу", attr: "administrative_area_level_1"}, required: required) +
          form.input(:city, input_html: {attr: "locality"}, wrapper_html: {class: "hide"}, required: required) +
          form.input(:district, disabled: true, input_html: {attr: "sublocality_level_1"}, wrapper_html: {class: "hide"}, required: required) +
          form.input(:street, disabled: true, input_html: { attr: "route" }, wrapper_html: {class: "hide"}, required: required) +
          form.input(:house_number, label: "Введіть номер будинку", wrapper_html: {class: ("hide" if resource.house_number.blank?)}, required: required) +
          form.input(:coordinates, label: "Введіть координати будинку", input_html: {attr: "coordinates"}, wrapper_html: {class: ("hide" if resource.coordinates.blank?)}, required: required)
        end
    end
  end
end
