String.prototype.replaceAt = (index, character)->
  return this.substr(0, index) + character + this.substr(index+character.length);


String.prototype.toCamelCase = ()->
  s = this
  s = s.replace /[\s\-_](.)/g, ($1)-> return $1.toUpperCase();
  s = s.replace(/[\s\-_]/g, '')
  s = s.replace /^(.)/, ($1)->  return $1.toLowerCase();
  s

String.prototype.toUpperCamelCase = ()->
  s = this.toCamelCase()
  s = s.replaceAt(0, s[0].toUpperCase())
  return s



window.template_path = (path)->
  "/assets/views/#{path}.html"

window.controller_name = (name)->
  "#{name.toUpperCamelCase()}Controller"


# =====================================================
# =====================================================
# Restful routes
# =====================================================
# =====================================================
#
#  .state "crm.managers",
#    url: "/managers"
#    #controller: controller_name("managers")
#    template: "<ui-view/>"
#
#  .state "crm.managers.new",
#    controller: controller_name("new_manager")
#    url: "/new"
#    templateUrl: template_path("managers/new")
#
#  .state "crm.managers.show",
#    url: "/managers/:id"
#    controller: controller_name("showManager")
#    templateUrl: template_path("managers/new")
#
#  .state "crm.managers.edit",
#    url: "/:id/edit"
#    controller: controller_name("showManager")
#    templateUrl: template_path("managers/new")
#
#
#  .state "crm.managers.index",
#    controller: controller_name("managers")
#    url: "/list"
#    templateUrl: template_path("managers/index")

window.resource_routes = (resource_name, routes_provider, options = {})->
  namespace = if (options.namespace && options.namespace.length) then options.namespace + "." else ""
  plural_resource_name = resource_name + (options.plural_suffix || "s")

#  routes_provider.state "crm.managers",
#    url: "/managers"
#    #controller: controller_name("managers")
#    template: "<ui-view/>"
#
#  routes_provider.state "crm.managers.new",
#    controller: controller_name("new_manager")
#    url: "/new"
#    templateUrl: template_path("managers/new")

  # dynamic

  routes_provider.state "#{namespace}#{plural_resource_name}",
    url: "/#{plural_resource_name}"
    #controller: controller_name("managers")
    template: "<ui-view/>"

  routes_provider.state "#{namespace}#{plural_resource_name}.index",
    controller: controller_name("#{plural_resource_name}")
    url: "/list"
    templateUrl: template_path("#{plural_resource_name}/index")


  routes_provider.state "#{namespace}#{plural_resource_name}.new",
    controller: controller_name("new_#{resource_name}")
    url: "/new"
    templateUrl: template_path("#{plural_resource_name}/new")

  routes_provider.state "#{namespace}#{plural_resource_name}.show",
    controller: controller_name("show_#{resource_name}")
    url: "/:id/show"
    templateUrl: template_path("#{plural_resource_name}/show")

  routes_provider.state "#{namespace}#{plural_resource_name}.edit",
    controller: controller_name("edit_#{resource_name}")
    url: "/:id/edit"
    templateUrl: template_path("#{plural_resource_name}/edit")


window.apply_field_defaults = (config, field_labels)->
  arr = []
  field_labels ?= {}
  if !angular.isArray(config)
    for k, v of config
      if typeof v == 'string'
        h = {key: k}
        arr.push(h)
      else
        if !v.key
          v.key = k
        arr.push(v)
  else
    arr = config
  for field in arr
    if !field.type
      field.type = 'input'
    if !field.hasOwnProperty("templateOptions")
      field.templateOptions = {}
    if !field.templateOptions.hasOwnProperty("label")
      field.templateOptions.label = field_labels[field.key] || field.key

  return arr