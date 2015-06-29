buildingsController = [
  "$scope"
  "$http"
  ($scope, $http)->

    #$scope.objects_count =
    promise = $http.get("/buildings/objects_count")
    $scope.objects_count = {}

    promise.success(
      (data)->
        $scope.objects_count = data
        console.log "objects_count: ", $scope.objects_count
    )
]

$crm.controller "BuildingsController", buildingsController