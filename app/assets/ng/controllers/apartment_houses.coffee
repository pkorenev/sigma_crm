apartment_house_form_fields = {
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
    text: "Багатоповерхові будинки"
    sref: "crm.buildings.apartment_houses.index"
  }

]



page_title = "Багатоповерхові будинки"





apartmentHousesController = [
  "$scope"
  "Restangular"
  "$http"
  ($scope, Restangular, $http)->
    $scope.new_item_button = {
      text: "Новий будинок",
      sref: "crm.buildings.apartment_houses.new"
    }

    $scope.breadcrumbs = angular.copy(breadcrumbs)
    $scope.page_title = page_title

    $scope.table_columns = [
      "address"
      "price"
      "country"
      "city"
    ]

    $scope.table_body_template_url = "/assets/views/apartment_houses/_table_body_row.html"

    baseComplexes = Restangular.all('apartment_houses');


    baseComplexes.getList().then(
      (complexes)->
        $scope.apartment_houses = complexes;
        for c in $scope.apartment_houses
          if c.price == null
            c.price_with_currency = "-"
          else
            c.price_with_currency = "#{c.price} #{c.price_currency || ""}"

          c.house_street_address = ()->
            addr = if c.street then c.street + (if c.apartment_house_number then ", " + c.apartment_house_number else '') else "-"
            return addr
    );

    #$scope.editManager = (m)->
    #  $state.go("crm.managers.edit", { id: m.id })

    $scope.delete = (m)->
      promise = $http.delete("/apartment_houses/#{m.id}.json")
      promise.then(
        ()->
#$scope.apartment_houses[id]
          index = $scope.apartment_houses.indexOf(m)
          $scope.apartment_houses.splice(index, 1)
      )
]

init_form_fields = (scope, http)->
  applied_config = apply_field_defaults(apartment_house_form_fields)
  scope.vm.fields = applied_config

  promise = http.get("/scheme/house_details_attributes")
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


newApartmentHouseController = [
  "$scope"
  "Restangular"
  "$http"
  ($scope, Restangular, $http)->
    $scope.breadcrumbs = breadcrumbs.concat([{text: "Створити новий", sref: "crm.buildings.apartment_houses.new"}])
    #$scope.breadcrumbs[2] = {text: "Створити новий", sref: "crm.buildings.apartment_houses.new"}
    $scope.page_title = "Створити новий будинок"



    baseComplexes = Restangular.all('apartment_houses')

    $scope.vm = {}

    $scope.vm_model = {}

    #console.log "applied_config", applied_config


    init_form_fields($scope, $http)








    $scope.vm.handleSubmit = ()->

      data = {apartment_house: $scope.vm_model}
      #promise = baseComplexes.post(data)
      console.log "data_for_create", data
      promise = $http.post("/apartment_houses", data)

      promise.then(
        ()->
          alert("Успішно створено")
      )

]

set_object = (Restangular, state_params, scope, model_property_name)->
  id = state_params.id
  baseApartment = Restangular.one("apartment_houses", id)
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

EditApartmentHouseController = [
  "$scope"
  "Restangular"
  "$stateParams"
  "$http"
  ($scope, Restangular, $stateParams, $http)->
    $scope.breadcrumbs = breadcrumbs

    $scope.vm = {}
    #applied_config = apply_field_defaults(apartment_house_form_fields)
    #$scope.vm.fields = applied_config


    promise = set_object(Restangular, $stateParams, $scope, "vm_model")
    promise.then(
      (c)->
        $scope.breadcrumbs = breadcrumbs.concat([{text: c.name, sref: "crm.buildings.apartment_houses.show({id: #{c.id})"}, {text: "Редагувати", sref: "crm.buildings.apartment_houses.edit({id: #{c.id})"}])
    )


    init_form_fields($scope, $http)


    $scope.vm.handleSubmit = ()->
      promise = save_object($http, $scope.vm_model, "apartment_house", "/apartment_houses/#{$scope.vm_model.id}")
      promise.then(
        ()->
          alert("Успішно збережено")
      )


]

ShowApartmentHouseController = [
  "$scope"
  "Restangular"
  "$stateParams"
  "$http"
  ($scope, Restangular, $stateParams, $http)->


    $scope.vm = {}
    promise = set_object(Restangular, $stateParams, $scope, "house")
    promise.then(
      (c)->
        $scope.breadcrumbs = breadcrumbs.concat([{text: c.name, sref: "crm.buildings.apartment_houses.show({id: #{c.id})"}])
    )


    $scope.item_properties = [
      "name"
      "price"
      "country"
      "city"
    ]


]


$crm.controller "ApartmentHousesController", apartmentHousesController
$crm.controller "NewApartmentHouseController", newApartmentHouseController
$crm.controller "ShowApartmentHouseController", ShowApartmentHouseController
$crm.controller "EditApartmentHouseController", EditApartmentHouseController
