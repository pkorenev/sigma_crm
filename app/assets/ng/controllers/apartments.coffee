apartment_info_fields = {
  "exterior_walls_description"
  "appartment_separator_walls_description"
  "appartment_inner_separator_walls_description"
  "height_description"
  "filling_openings_in_walls_description"
  "phone_description"
  "internet_description"
  "tv_description"
  "kitchen_stove_description"
  "wiring_description"
  "plumbing_description"
  "heating_description"
  "ventilation_description"
  "water_supply_description"
  "meters_description"
  "internal_sewer_system_description"
  "internal_finishing_work_description"
  "beautification_description"
  "additional_info"
}

field_labels = {
  building_complex: "Житловий комплекс"
  street: "вулиця"
  house_number: "номер будинку"
  apartment_number: "номер квартири"
  total_square: "загальна площа"
  apartments_square: "житлова площа"
  rooms_count: "кількість кімнат"



  # apartment info

  "exterior_walls_description": "Зовнішні стіни"
  "appartment_separator_walls_description": "Міжквартирні стіни"
  "appartment_inner_separator_walls_description": "Внутрішньоквартирні перегородки"
  "height_description": "Висота"
  "filling_openings_in_walls_description": "Заповнення прорізів у стінах"
  "phone_description": "Телефонія"
  "internet_description": "інтернет"
  "tv_description": "телебачення"
  "kitchen_stove_description": "Тип кухонної плити"
  "wiring_description": "Електропроводка"
  "plumbing_description": "Сантехнічні прилади"
  "heating_description": "Система опалення"
  "ventilation_description": "Вентиляція"
  "water_supply_description": "Внутрішні системи холодного та гарячого водопостачання"
  "meters_description": "Встановлення лічильників"
  "internal_sewer_system_description": "Система внутрішньої побутової каналізації"
  "internal_finishing_work_description": "Внутрішні оздоблювальні роботи"
  "beautification_description": "Благоустрій"
  "additional_info": "Додаткова інформація"
}

apartment_form_fields = {
  # step 1
  street: {

  }
  house_number: {

  }

  building_complex: {
    type: "select"
    templateOptions:
      options: [
        {
          name: "test1"
          value: "1"
        }
        {
          name: "test2"
          value: "2"
        }
        {
          name: "test3"
          value: "3"
        }
      ]
    controller: ($scope, $http)->
      $scope.to.loading = $http.get("/building_complexes.json").then(
        (response)->
          opts = response.data.map( (r)-> return {name: r.name, value: r.id}  );
          $scope.to.options = opts
          # note, the line above is shorthand for:
          # $scope.options.templateOptions.options = data;
          console.log "options", opts

          return response;
      )

  }

  # step 2. technical properties

  total_square: {

  }

  apartments_square: {

  }

  apartment_number: {

  }

  level: {

  }

#  apartment_info: {
#    'type': 'lx-wrapper-flex-container'
#    'templateOptions':
#      'container': 'row'
#      'wrap': 'nowrap'
#      'align': 'space-between'
#      'class': 'bgc-red-500'
#      'style': 'height: 200px'
#    'fields': [ {} ]
#  }
}

angular.merge(apartment_form_fields,apartment_info_fields)

# step 3. attachments

# step 4. Finsh. Summary


#apartment_form_fields.apartment_info.fields = apply_field_defaults(apartment_info_fields)

applied_apartment_form_fields_config = apply_field_defaults(apartment_form_fields, field_labels)

ApartmentsController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    baseApartments = Restangular.all('apartments')
    $scope.new_item_button = {
      text: "Нова квартира",
      sref: "crm.buildings.apartments.new"
    }
]

ShowApartmentController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    baseApartments = Restangular.all('apartments')

]

NewApartmentController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    baseApartments = Restangular.all('apartments')
    $scope.vm = {}
    $scope.vm.fields = applied_apartment_form_fields_config
    $scope.vm.model = {}
    #console.log "fields", applied_apartment_form_fields_config


    $scope.vm.handleSubmit = ()->
      data = {apartment: $scope.vm.model}
      #baseManagers.post($scope.vm.model)
      baseApartments.post(data)
]

EditApartmentController = [
  "$scope"
  "Restangular"
  "$stateParams"
  "$http"
  ($scope, Restangular, $stateParams, $http)->
    baseApartments = Restangular.all('apartments')
    $scope.vm = {}
    $scope.vm.fields = applied_apartment_form_fields_config

    id = $stateParams.id

    baseApartment = Restangular.one("apartments", id)

    managerPromise = baseApartment.get()
    managerPromise.then(
      (a)->
        #m.prettifyAmount(); // invoke your custom model method
        $scope.vm.model = a
    );

    $scope.vm.handleSubmit = ()->
      #data = {apartment: $scope.vm.model}
      #baseApartment.put(data)
      #$scope.vm.model.put()
      #$scope.vm.model.save()
      console.log "model_id", $scope.vm.model.id
      console.log "model", $scope.vm.model
      #$http.put("/apartments/#{$scope.vm.model.id}", $scope.vm.model)

]

$crm.controller "ApartmentsController", ApartmentsController
$crm.controller "EditApartmentController", EditApartmentController
$crm.controller "NewApartmentController", NewApartmentController
$crm.controller "ShowApartmentController", ShowApartmentController