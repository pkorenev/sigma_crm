config = ($stateProvider, $urlRouterProvider, $ocLazyLoadProvider, IdleProvider, KeepaliveProvider)->
  $urlRouterProvider.otherwise("/dashboard");



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
  .state "crm.new_building",
    url: "/buildings/new"
    templateUrl: template_path("buildings/new")

  .state "crm.buildings.penthouses",
    url: "/penthouses"
    templateUrl: template_path("penthouses/index")
    controller: controller_name("buildings")

  .state "crm.buildings.apartments",
    url: "/apartments"
    templateUrl: template_path("buildings/index")
    controller: controller_name("buildings")

  .state "crm.buildings.apartment_houses",
    url: "/apartment_houses"
    templateUrl: template_path("buildings/index")
    controller: controller_name("buildings")

    ###
  .state "crm.managers",
    url: "/managers"
    controller: controller_name("managers")
    template: "<div ui-view></div>"
    ###

  .state "crm.managers",
    controller: controller_name("managers")
    url: "/managers"
    templateUrl: template_path("managers/index")



$crm
  .config(config)
  .run ($rootScope, $state)->
    $rootScope.$state = $state

