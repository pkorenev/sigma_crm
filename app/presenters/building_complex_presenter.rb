class BuildingComplexPresenter < BuildingContainerPresenter
  def form_address
    content_tag :div, class: "group address" do
      content_tag(:h3, "Адреса") +
        content_tag(:div, class: "group-content") do
          form.association( :parent, label: "Житловий комплекс", collection: BuildingComplex.all, required: true) +
          form.input(:coordinates)
        end
    end
  end
end
