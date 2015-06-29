penthousesController = ()->
  $scope.new_item_button = {
    text: "Новий особняк",
    sref: "crm.buildings.penthouses.new"
  }
$crm.controller "PenthousesController", penthousesController