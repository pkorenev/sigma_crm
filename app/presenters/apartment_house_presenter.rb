class ApartmentHousePresenter < BuildingContainerPresenter
  def form_address
    content_tag :div, class: "group address" do
      content_tag(:h3, "Адреса") +
          content_tag(:div, class: "group-content") do
            form.association(:building_complex, label: "Житловий комплекс", collection: BuildingComplex.all, required: true) +
            form.input(:street, required: true, placeholder: resource.computed_street) +
            form.input(:house_number, required: true) +
            form.input(:coordinates, required: true)
            #form.input(:street_address)
            #form.input(:coordinates)
          end
    end
  end
end