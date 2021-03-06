breadcrumbs = [
  {
    text: "Дашборд"
    sref: "crm.dashboard"
  }
  {
    text: "Менеджери"
    sref: "crm.managers"
  }
]

managersController = [
  "$scope"
  "Restangular"
  "$state"

  ($scope, Restangular, $state)->
    $scope.breadcrumbs = breadcrumbs

    baseManagers = Restangular.all('managers');

    baseManagers.getList().then(
      (managers)->
        $scope.allManagers = managers;
    );

    $scope.editManager = (m)->
      $state.go("crm.managers.edit", { id: m.id })

    $scope.deleteManager = (m)->

]

manager_form_fields = [
  {
    type: "input"
    key: "email"
    templateOptions: {
      label: "Електронна пошта"
      required: true
      type: "email"
    }
  }
  {
    type: "input"
    key: "password"
    templateOptions: {
      label: "Пароль"
      required: true
      type: "password"
      minlength: 8
    }
#        validators: {
#          password_confirmed:
#            expression: (view_value, model_value, scope)->
#              view_value == scope.model.password_confirmation
#            message: "Паролі повинні співпадати"
#        }
  }
  {
    type: "input"
    key: "password_confirmation"
    templateOptions: {
      label: "Підтвердіть пароль"
      required: true
      type: "password"
    }
    expressionProperties: {
      "templateOptions.valid": (modelValue, viewValue, scope)->
        console.log("args: ", scope.model.password == scope.model.password_confirmation)
    }
    validators: {
      password_confirmed:
        expression: (view_value, model_value, scope)->
          scope.model.password == view_value
        message: "Паролі повинні співпадати"
    }
  }
  {
    type: "input"
    key: "last_name"
    templateOptions: {
      label: "Прізвище"
      required: true
    }
  }
  {
    type: "input"
    key: "first_name"
    templateOptions: {
      label: "Ім’я"
      required: true
    }
  }
  {
    type: "input"
    key: "middle_name"
    templateOptions: {
      label: "По-батькові"
      required: true
    }
  }
  {
    type: "input"
    key: "phone"
    templateOptions: {
      label: "Телефон"
      required: true
    }
  }
  {
    key: 'country',
    type: 'input',
    templateOptions: {
      required: true
      label: "Країна"
#description: 'Description : this is a nice select!',
      options: [
        {name: 'Paris', value: 'paris_city', group: 'EU'},
        {name: 'New York', value: 'new_york_city', group: 'USA'},
        {name: 'Berlin', value: 'berlin_city', group: 'EU'},
        {name: 'Salt Lake City', value: 'salt_lake_city_city', group: 'USA'},
      ]
    }
  }
  {
    type: "input"
    key: "city"
    templateOptions: {
      required: true
      label: "Місто"
    }
  }
  {
    type: "input"
    key: "street"
    templateOptions: {
      label: "Вулиця"
    }
  }
  {
    type: "input"
    key: "house_number"
    templateOptions: {
      label: "Будинок"
      type: "number"
    }
  }
  {
    type: "input"
    key: "apartment_number"
    templateOptions: {
      label: "Квартира"
      type: "number"
    }
  }

]

newManagerController = [
  "$scope"
  #"formly"
  "Restangular"
  ($scope, Restangular)->
    $scope.breadcrumbs = breadcrumbs

    baseManagerRegistrations = Restangular.all('managers')

    $scope.vm = {}

    $scope.vm.model = {country: "Україна"}
    $scope.vm.fields = manager_form_fields

    $scope.vm.handleSubmit = ()->
      data = {manager: $scope.vm.model}
      #baseManagers.post($scope.vm.model)
      baseManagerRegistrations.post(data)

]

showManagerController = [
  "$stateParams"
  ($stateParams)->

]

editManagerController = [
  "$scope"
  "Restangular"
  "$stateParams"
  ($scope, Restangular, $stateParams)->
    $scope.breadcrumbs = breadcrumbs

    baseManagerRegistrations = Restangular.all('managers');

    id = $stateParams.id

    baseManagerRegistration = Restangular.one("managers", id)

    $scope.vm = {}

    managerPromise = baseManagerRegistration.get()
    managerPromise.then(
      (m)->
        #m.prettifyAmount(); // invoke your custom model method
        $scope.vm.model = m
    );




    $scope.vm.fields = manager_form_fields

    $scope.vm.handleSubmit = ()->
      alert("submit")
      #baseManagers.post($scope.vm.model)
      #baseManagerRegistrations.put($scope.vm.model)
      $scope.vm.model.put()
]

$crm.controller "ManagersController", managersController
$crm.controller "NewManagerController", newManagerController
$crm.controller "ShowManagerController", showManagerController
$crm.controller "EditManagerController", editManagerController