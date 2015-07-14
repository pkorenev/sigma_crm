class WizardStepBuilder
  attr_accessor :fields, :name
  def initialize(name)
    @name = name
    @fields = []
  end

  def field(attr_name)
    @fields << attr_name
  end

  def build
    @fields
  end
end