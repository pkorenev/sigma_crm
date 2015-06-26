class ApartmentsController < BuildingsController

  def index
    super
    @table_columns = [ 'Адреса', 'Price', 'Price currency']
  end

  def resource_class
    Apartment
  end
end