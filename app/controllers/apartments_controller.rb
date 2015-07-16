class ApartmentsController < BuildingsController
  #before_action do
   #render inline: params.inspect
  #end







  def resource_class
    Apartment
  end

  protected

  def resource_params

    super
    params.require(resource_name).permit(*Apartment.attribute_names, *ApartmentInfo.attribute_names, *ApartmentDetails.attribute_names)
    #params.require(resource_name).permit(:full_description, :status, :type, :price, :price_currency, :name, :country, :city, *(ApartmentDetails.descriptive_attribute_names), :avatar)
    #params.require(:apartment).permit(:full_description, :type, :price, :price_currency, :name, :house_number, :apartment_number, *(Apartment.details_attribute_names), :street, :index, :city, :country, :full_address, :level)
  end

  def add_breadcrumbs
    super

  end

end