navigationController = ($scope)->
  admin_menu_items = [
    {
      text: "Дашборд"
      sref: "crm.dashboard"
      icon_class: "fa fa-th-large"
    }
    {
      text: "Нерухомість"
      sref: "crm.buildings"
      icon_class: "fa fa-th-large"
      menu_items: [
        {
          text: "Квартири"
          sref: "crm.buildings.apartments"
          icon_class: "fa fa-th-large"
        }
        {
          text: "Багатовартирні будинки"
          sref: "crm.buildings.apartment_houses"
          icon_class: "fa fa-th-large"
        }
        {
          text: "Особняки"
          sref: "crm.buildings.penthouses"
          icon_class: "fa fa-th-large"
        }
      ]
    }
    {
      text: "Менеджери"
      sref: "crm.managers"
      icon_class: "fa fa-th-large"
    }


  ]

  $scope.menu_items = admin_menu_items



$crm.controller "NavigationController", [
  "$scope"
  navigationController
]