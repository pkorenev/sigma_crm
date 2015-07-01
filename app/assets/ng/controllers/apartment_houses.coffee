apartment_house_form_fields = {

}

ApartmentHousesController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    $scope.new_item_button = {
      text: "Новий будинок",
      sref: "crm.buildings.apartment_houses.new"
    }

    baseApartmentHouses = Restangular.all('apartment_houses')

]

ShowApartmentHouseController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    baseApartmentHouses = Restangular.all('apartment_houses')

]

NewApartmentHouseController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    baseApartmentHouses = Restangular.all('apartment_houses')

]

EditApartmentHouseController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    baseApartmentHouses = Restangular.all('apartment_houses')

]

$crm.controller "ApartmentHousesController", ApartmentHousesController
$crm.controller "EditApartmentHouseController", EditApartmentHouseController
$crm.controller "NewApartmentHouseController", NewApartmentHouseController
$crm.controller "ShowApartmentHouseController", ShowApartmentHouseController