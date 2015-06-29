apartmentsController = [
  "$scope"
  ($scope)->
    $scope.new_item_button = {
      text: "Нова квартира",
      sref: "crm.buildings.apartments.new"
    }


]

$crm.controller "ApartmentsController", apartmentsController