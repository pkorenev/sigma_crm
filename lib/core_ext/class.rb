class Class
  def ancestor_classes(except_self = false, while_class = nil)
    classes = self.ancestors.select{|a| a.instance_of?(Class) }
    if except_self
      classes = classes.select.with_index{|a, i| i != 0 }
    end

    if while_class && while_class.instance_of?(Class)
      last_index = classes.index(while_class)
      classes = classes[0, last_index]
    end
    classes
  end
end