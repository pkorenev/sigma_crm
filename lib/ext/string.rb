class String
  def singular?()
    str = self
    str.pluralize != str && str.singularize == str
  end

  def plural?()
    str = self
    str.singularize != str && str.pluralize == str
  end
end