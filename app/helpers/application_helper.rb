module ApplicationHelper
  def inline_sass filename, options = {}
    full_name = "#{Rails.root.join('app/assets/stylesheets/')}#{filename}.scss"
    s = Sass::Engine.for_file(full_name, options).render
    return "<style>#{s}</style>"
  end
end
