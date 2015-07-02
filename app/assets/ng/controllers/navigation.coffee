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
          text: "Житлові комплекси"
          sref: "crm.buildings.building_complexes"
          rest: true
        }

        {
          text: "Багатоквартирні будинки"
          sref: "crm.buildings.apartment_houses"
          rest: true
        }

        {
          text: "Квартири"
          sref: "crm.buildings.apartments"
          rest: true
        }

        {
          text: "Особняки"
          sref: "crm.buildings.penthouses"
          rest: true
        }
      ]
    }
    {
      text: "Менеджери"
      sref: "crm.managers"
      rest: true
      icon_class: "fa fa-th-large"
    }


  ]

  $scope.menu_items = admin_menu_items



$crm.controller "NavigationController", [
  "$scope"
  navigationController
]