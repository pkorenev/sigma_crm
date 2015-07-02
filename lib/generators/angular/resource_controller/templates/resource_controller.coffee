<%= resource_name %>_form_fields = {

}

<%= index_controller_name %> = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    base<%= resource_name.pluralize.camelize %> = Restangular.all('<%= resource_name.pluralize.underscore %>')

]

<%= show_controller_name %> = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    base<%= resource_name.pluralize.camelize %> = Restangular.all('<%= resource_name.pluralize.underscore %>')

]

<%= new_controller_name %> = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    base<%= resource_name.pluralize.camelize %> = Restangular.all('<%= resource_name.pluralize.underscore %>')

]

<%= edit_controller_name %> = [
  "$scope"
  "Restangular"
  ($scope, Restangular)->
    base<%= resource_name.pluralize.camelize %> = Restangular.all('<%= resource_name.pluralize.underscore %>')

]

<%= module_var_name %>.controller "<%= index_controller_name %>", <%= index_controller_name %>
<%= module_var_name %>.controller "<%= edit_controller_name %>", <%= edit_controller_name %>
<%= module_var_name %>.controller "<%= new_controller_name %>", <%= new_controller_name %>
<%= module_var_name %>.controller "<%= show_controller_name %>", <%= show_controller_name %>