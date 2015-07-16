class BuildingComplexPresenter < BuildingContainerPresenter
  def form_address
    content_tag :div, class: "group address" do
      content_tag(:h3, "Адреса") +
        content_tag(:div, class: "group-content") do
          form.input(:coordinates)
        end
    end
  end
end
