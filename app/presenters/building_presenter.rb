class BuildingPresenter < Keynote::Presenter
  presents :form, :resource
  def builder

  end

  def form_avatar
    form.input :avatar, as: :file do
      image_tag(resource.avatar.url) +
          form.input_field( :avatar, as: :file)
    end
  end

  def form_status
    form.input :status, as: :select, collection: [["Будується", 1], [ "Побудовано", 2]], default: 2
  end

  def form_address
    content_tag :div, class: "group address" do
      content_tag(:h3, "Адреса") +
          content_tag(:div, class: "group-content") do
            #form.input :apartment_address
            form.input(:apartment_number, as: :integer)
          end
    end
  end
end