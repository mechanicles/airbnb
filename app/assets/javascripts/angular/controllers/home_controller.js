var MyApp = angular.module('airbnb', []);

MyApp.controller("HomeController", ['$scope', '$http', function($scope, $http) {
  $http.get('/home/index.json')
    .then(function(response) {
      $scope.data = response.data;
      $scope.featured_spaces = $scope.data.featured_spaces;
      $scope.unfeatured_spaces = $scope.data.unfeatured_spaces;

      console.log($scope.featured_spaces);
      console.log($scope.unfeatured_spaces);
    });
}]);
