$crm.config(['formlyConfigProvider', function(formlyConfigProvider) {
    //nya-bs-select : grouped select template :
    var groupedSelectTemplate =   '  <ol class="nya-bs-select col-sm-12 col-xs-12 col-md-12 col-lg12" ' +
        '		ng-model="model[options.key || index]" ' +
        '       data-live-search="true" ' +
        '       disabled="options.templateOptions.options.length === 0">' +
        '       <li nya-bs-option="option in  options.templateOptions.options group by option.group"  ' +
        '       >' +
        '         <span class="dropdown-header">{{$group}}</span>' +
        '         <a>' +
        '           <span>{{option.name}}</span>' +
        '           <span class="glyphicon glyphicon-ok check-mark"></span>' +
        '         </a>' +
        '       </li>' +
        '     </ol>';

    formlyConfigProvider.setType(
        {
            name: 'groupedSelect',
            template: groupedSelectTemplate
        }
    );
}]);