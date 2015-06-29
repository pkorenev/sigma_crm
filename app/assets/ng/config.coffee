config = ($stateProvider, $urlRouterProvider, $ocLazyLoadProvider, IdleProvider, KeepaliveProvider)->
  $urlRouterProvider.otherwise("/dashboard");

  empty_view = "<div ui-view></div>"


  $stateProvider
  .state "crm",
    abstract: true
    url: ""
    templateUrl: template_path("common/content")

  .state "crm.dashboard",
    url: "/dashboard"
    templateUrl: template_path("dashboard")

  .state "crm.buildings",
    url: "/buildings"
    templateUrl: template_path("buildings/index")
    controller: controller_name("buildings")
  .state "crm.buildings.new",
    url: "/buildings/new"
    templateUrl: template_path("buildings/new")

  .state "crm.buildings.penthouses",
    url: "/penthouses"
    templateUrl: template_path("penthouses/index")
    controller: controller_name("penthouses")

  .state "crm.buildings.apartments",
    url: "/apartments"
    templateUrl: template_path("buildings/index")
    controller: controller_name("apartments")

  .state "crm.buildings.apartments.new",
    url: "/apartments"
    templateUrl: template_path("buildings/index")
    controller: controller_name("new_apartment")

  .state "crm.buildings.apartment_houses",
    url: "/apartment_houses"
    templateUrl: template_path("buildings/index")
    controller: controller_name("apartment_houses")

  .state "crm.buildings.building_complexes",
    url: "/building_complexes"
    templateUrl: template_path("buildings/index")
    controller: controller_name("building_complexes")

  .state "crm.managers",
    url: "/managers"
    #controller: controller_name("managers")
    template: empty_view

  .state "crm.managers.index",
    controller: controller_name("managers")
    url: "/list"
    templateUrl: template_path("managers/index")

  .state "crm.managers.new",
    controller: controller_name("new_manager")
    url: "/new"
    templateUrl: template_path("managers/new")



$crm
  .config(config)
  .run ($rootScope, $state)->
    $rootScope.$state = $state

