class BuildingContainerPresenter < Keynote::Presenter
  presents :form, :resource
  def builder

  end

  def form_status(required = true)
    form.input(:status, required: required, as: :select, collection: [["Будується", 1], [ "Побудовано", 2]], default: 2)
  end

  def form_address
    content_tag :div, class: "group address" do
      content_tag(:h3, "Адреса") +
          content_tag(:div, class: "group-content") do
            #form.input :apartment_address
            form.input(:apartment_number, as: :integer) +
                form.input(:coordinates)
          end
    end
  end

  def form_infrastructure

    content_tag :div, class: "group address" do
      content_tag(:h3, "Призначення та інфраструктура") +
          content_tag(:div, class: "group-content") do
            form.input(:main_purpose) +
                form.input(:commercial_premises) +
                form.input(:parking_type_description) +
                form.input(:playground)
          end
    end
  end

  def form_house_tech_parameters
    content_tag :div, class: "group address" do
      content_tag(:h3, "Технічні параметри будинку") +
          content_tag(:div, class: "group-content") do
            form.input(:levels_count) +
                form.input(:apartments_count) +
                form.input(:sections_count) +
                form.input(:construction_description) +
                form.input(:construction_material_text) +
                form.input(:exterior_walls_description) +
                form.input(:insulation_type_description) +
                form.input(:facade_description) +
                form.input(:windows_description) +
                form.input(:roof_structure) +
                form.input(:level_height) +
                form.input(:heating_type) +
                form.input(:lifts_count) +
                form.input(:additional_description, as: :text)
          end
    end
  end

  def form_house_building_date_range(required = true)
    form.input(:building_start_date_string, required: required) +
    form.input(:estimated_building_end_date_string, required: required)
  end

  def form_buildings_presence(required = true)
    form.input(:presence_string, required: required)
  end

  def form_price_per_meter(required = true)
    form.input(:price_per_meter, label: raw(resource.class.human_attribute_name(:price_per_meter)), required: required)
  end

  def form_avatar
    form.input :avatar, as: :file do
      image_tag(resource.avatar.url) +
          form.input_field( :avatar, as: :file)
    end
  end


  # show section

  def show_status
    vertical_table_field :status, resource: resource
  end

  def show_complex
    vertical_table_field :building_complex, {resource: resource}, link_to(resource.building_complex, [resource.building_complex])

  end
end
