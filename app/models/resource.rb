module Resource
  def self.included(klass)
    klass.extend Resource::ClassMethods
    klass.include ActiveRecordResourceExpiration
    klass.include PaperclipEnhancements::InstanceMethods
    klass.extend PaperclipEnhancements::ClassMethods
    klass.class_eval(&:my_included)
  end

  def accessible_all_attributes
    attr_accessible(*attribute_names)
  end
end