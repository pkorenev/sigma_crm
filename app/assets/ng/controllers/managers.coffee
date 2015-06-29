managersController = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    $scope.breadcrumbs = [
      {
        text: "Дашборд"
        sref: "crm.dashboard"
      }
      {
        text: "Менеджери"
        sref: "crm.managers"
      }
    ]

    baseManagers = Restangular.all('managers');

    baseManagers.getList().then(
      (managers)->
        $scope.allManagers = managers;
    );
]

$crm.controller "ManagersController", managersController

