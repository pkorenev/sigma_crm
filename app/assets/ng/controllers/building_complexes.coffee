building_complex_form_fields = {
  name: {

  }

  country: {

  }

  city: {

  }
  price: {

  }
  price_currency: {

  }
}

field_defaults = {
  type: 'input'
}





buildingComplexesController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    $scope.new_item_button = {
      text: "Новий комплекс",
      sref: "crm.buildings.building_complexes.new"
    }

    #$scope.breadcrumbs = breadcrumbs

    $scope.table_columns = [
      "price"
      "country"
      "city"
    ]

    $scope.table_body_template_url = "/assets/views/building_complexes/_table_body_row.html"

    baseComplexes = Restangular.all('building_complexes');

    baseComplexes.getList().then(
      (complexes)->
        $scope.building_complexes = complexes;
        for c in $scope.building_complexes
          if c.price == null
            c.price_with_currency = "-"
          else
            c.price_with_currency = "#{c.price} #{c.price_currency || ""}"
    );

    $scope.editManager = (m)->
      $state.go("crm.managers.edit", { id: m.id })

    $scope.deleteManager = (m)->
]

newBuildingComplexController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->

    baseComplexes = Restangular.all('building_complexes')

    $scope.vm = {}

    $scope.vm.model = {}
    applied_config = apply_field_defaults(building_complex_form_fields)
    #console.log "applied_config", applied_config
    $scope.vm.fields = applied_config

    $scope.vm.handleSubmit = ()->

      data = {building_complex: $scope.vm.model}
      baseComplexes.post(data)

]

set_object = (state_params, scope, base_query_model)->
  id = state_params.id
  baseApartment = Restangular.one("building_complexes", id)

  promise = baseApartment.get()
  promise.then(
    (a)->
      scope.vm.model = a
  )

EditBuildingComplexController = [
  "$scope"
  "Restangular"
  "$stateParams"
  "$http"
  ($scope, Restangular, $stateParams, $http)->
    baseApartments = Restangular.all('apartments')
    $scope.vm = {}
    $scope.vm.fields = applied_apartment_form_fields_config

    set_object($stateParams, $scope)


    #baseApartment = Restangular.one("apartments", id)

#    managerPromise = baseApartment.get()
#    managerPromise.then(
#      (a)->
##m.prettifyAmount(); // invoke your custom model method
#        $scope.vm.model = a
#    );

    $scope.vm.handleSubmit = ()->
#data = {apartment: $scope.vm.model}
#baseApartment.put(data)
#$scope.vm.model.put()
#$scope.vm.model.save()
      console.log "model_id", $scope.vm.model.id
      console.log "model", $scope.vm.model
#$http.put("/apartments/#{$scope.vm.model.id}", $scope.vm.model)

]

ShowBuildingComplexController = [
  "$scope"
  "Restangular"
  "$stateParams"
  "$http"
  ($scope, Restangular, $stateParams, $http)->
    baseBuildingComplexes = Restangular.all('building_complexes')
    $scope.vm = {}
    #$scope.vm.fields = applied_apartment_form_fields_config

    id = $stateParams.id

]


$crm.controller "BuildingComplexesController", buildingComplexesController
$crm.controller "NewBuildingComplexController", newBuildingComplexController
$crm.controller "ShowBuildingComplexController", ShowBuildingComplexController
$crm.controller "EditBuildingComplexController", EditBuildingComplexController
