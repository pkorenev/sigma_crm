class ApartmentPresenter < Keynote::Presenter
  presents :form, :resource
  def builder

  end

  def form_avatar
    return form.input :avatar, as: :file do
      image_tag resource.avatar.url
      form.input_field :avatar, as: :file
    end
  end
end
