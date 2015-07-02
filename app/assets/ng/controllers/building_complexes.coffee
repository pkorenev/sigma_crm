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

breadcrumbs = [
  {
    text: "Дашборд"
    sref: "crm.dashboard"
  }
  {
    text: "Нерухомість"
  }
  {
    text: "Житлові комплекси"
    sref: "crm.buildings.building_complexes.index"
  }

]



page_title = "Житлові комплекси"





buildingComplexesController = [
  "$scope"
  "Restangular"
  "$http"
  ($scope, Restangular, $http)->
    $scope.new_item_button = {
      text: "Новий комплекс",
      sref: "crm.buildings.building_complexes.new"
    }

    $scope.breadcrumbs = angular.copy(breadcrumbs)
    $scope.page_title = page_title

    $scope.table_columns = [
      "name"
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

    #$scope.editManager = (m)->
    #  $state.go("crm.managers.edit", { id: m.id })

    $scope.delete = (m)->
      promise = $http.delete("/building_complexes/#{m.id}.json")
      promise.then(
        ()->
          #$scope.building_complexes[id]
          index = $scope.building_complexes.indexOf(m)
          $scope.building_complexes.splice(index, 1)
      )
]

init_form_fields = (scope, http)->
  applied_config = apply_field_defaults(building_complex_form_fields)
  scope.vm.fields = applied_config

  promise = http.get("/scheme/building_complex_details_attributes")
  promise.then(
    (response)->
      #alert "success"
      all_fields = applied_config.concat(response.data)
      console.log "all_fields", all_fields
      scope.vm.fields = all_fields
      #for v in response.data
      #  $scope.vm.fields.push(v)
      scope.vm.fields_loaded = true
    ()->
      alert("error")
  )


newBuildingComplexController = [
  "$scope"
  "Restangular"
  "$http"
  ($scope, Restangular, $http)->
    $scope.breadcrumbs = breadcrumbs.concat([{text: "Створити новий", sref: "crm.buildings.building_complexes.new"}])
    #$scope.breadcrumbs[2] = {text: "Створити новий", sref: "crm.buildings.building_complexes.new"}
    $scope.page_title = "Створити новий житловий комплекс"



    baseComplexes = Restangular.all('building_complexes')

    $scope.vm = {}

    $scope.vm_model = {}

    #console.log "applied_config", applied_config


    init_form_fields($scope, $http)








    $scope.vm.handleSubmit = ()->

      data = {building_complex: $scope.vm_model}
      #promise = baseComplexes.post(data)
      console.log "data_for_create", data
      promise = $http.post("/building_complexes", data)

      promise.then(
        ()->
          alert("Успішно створено")
      )

]

set_object = (Restangular, state_params, scope, model_property_name)->
  id = state_params.id
  baseApartment = Restangular.one("building_complexes", id)
  promise = baseApartment.get()
  promise.then(
    (c)->
      if c.price == null
        c.price_with_currency = "-"
      else
        c.price_with_currency = "#{c.price} #{c.price_currency || ""}"
      scope[model_property_name] = c
  )



  return promise

save_object = (http, object, object_name, url)->
  data = {}
  data[object_name] = object
  promise = http.put(url, data)
  return promise

EditBuildingComplexController = [
  "$scope"
  "Restangular"
  "$stateParams"
  "$http"
  ($scope, Restangular, $stateParams, $http)->
    $scope.breadcrumbs = breadcrumbs

    $scope.vm = {}
    #applied_config = apply_field_defaults(building_complex_form_fields)
    #$scope.vm.fields = applied_config


    promise = set_object(Restangular, $stateParams, $scope, "vm_model")
    promise.then(
      (c)->
        $scope.breadcrumbs = breadcrumbs.concat([{text: c.name, sref: "crm.buildings.building_complexes.show({id: #{c.id})"}, {text: "Редагувати", sref: "crm.buildings.building_complexes.edit({id: #{c.id})"}])
    )


    init_form_fields($scope, $http)


    $scope.vm.handleSubmit = ()->
      promise = save_object($http, $scope.vm_model, "building_complex", "/building_complexes/#{$scope.vm_model.id}")
      promise.then(
        ()->
          alert("Успішно збережено")
      )


]

ShowBuildingComplexController = [
  "$scope"
  "Restangular"
  "$stateParams"
  "$http"
  ($scope, Restangular, $stateParams, $http)->


    $scope.vm = {}
    set_object(Restangular, $stateParams, $scope, "complex")



    $scope.item_properties = [
      "name"
      "price"
      "country"
      "city"
    ]


]


$crm.controller "BuildingComplexesController", buildingComplexesController
$crm.controller "NewBuildingComplexController", newBuildingComplexController
$crm.controller "ShowBuildingComplexController", ShowBuildingComplexController
$crm.controller "EditBuildingComplexController", EditBuildingComplexController
