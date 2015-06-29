buildingComplexesController = ()->
  $scope.new_item_button = {
    text: "Новий комплекс",
    sref: "crm.buildings.building_complexes.new"
  }
$crm.controller "BuildingComplexesController", buildingComplexesController