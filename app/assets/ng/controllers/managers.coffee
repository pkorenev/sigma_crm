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
  ($scope, Restangular)->
    $scope.breadcrumbs = breadcrumbs

    baseManagers = Restangular.all('managers');

    baseManagers.getList().then(
      (managers)->
        $scope.allManagers = managers;
    );
]

newManagerController = [
  "$scope"
  #"formly"
  ($scope)->
    $scope.breadcrumbs = breadcrumbs

    $scope.vm = {}

    $scope.vm.model = {}
    $scope.vm.fields = [
      {
        type: "input"
        key: "last_name"
        templateOptions: {
          label: "Прізвище"
        }
      }
      {
        type: "input"
        key: "first_name"
        templateOptions: {
          label: "Ім’я"
        }
      }
      {
        type: "input"
        key: "middle_name"
        templateOptions: {
          label: "По-батькові"
        }
      }
      {
        type: "input"
        key: "phone"
        templateOptions: {
          label: "Телефон"
        }
      }
      {
        type: "select"
        key: "country"
        templateOptions: {
          label: "Країна"
        }
      }
      {
        type: "input"
        key: "city"
        templateOptions: {
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

]

$crm.controller "ManagersController", managersController
$crm.controller "NewManagerController", newManagerController
