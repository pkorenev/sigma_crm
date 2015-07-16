class ApartmentPresenter < Keynote::Presenter
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
end
