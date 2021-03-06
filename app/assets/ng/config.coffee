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
    template: "<ui-view/>"
    controller: controller_name("buildings")

  .state "crm.buildings.new",
    url: "/buildings/new"
    templateUrl: template_path("buildings/new")

#  .state "crm.buildings.penthouses",
#    url: "/penthouses"
#    templateUrl: template_path("penthouses/index")
#    controller: controller_name("penthouses")

#  .state "crm.buildings.apartment_houses",
#    url: "/apartment_houses"
#    templateUrl: template_path("apartment_houses/index")
#    controller: controller_name("apartment_houses")

#  .state "crm.buildings.apartments",
#    url: "/apartments"
#    templateUrl: template_path("apartments/index")
#    controller: controller_name("apartments")
#
#  .state "crm.buildings.apartments.new",
#    url: "/new"
#    templateUrl: template_path("buildings/index")
#    controller: controller_name("new_apartment")

  resource_routes("penthouse", $stateProvider, {namespace: "crm.buildings"})

  resource_routes("apartment_house", $stateProvider, {namespace: "crm.buildings"})

  resource_routes("apartment", $stateProvider, {namespace: "crm.buildings"})

  resource_routes("building_complex", $stateProvider, {namespace: "crm.buildings", plural_suffix: "es"})

  resource_routes('manager', $stateProvider, {namespace: "crm"})

  console.log



$crm
  .config(config)
  .run ($rootScope, $state)->
    $rootScope.$state = $state

