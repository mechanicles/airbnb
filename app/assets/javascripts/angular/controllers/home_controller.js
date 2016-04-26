var MyApp = angular.module('airbnb', ['ngRoute', 'ngResource']);

MyApp.factory('Home', ['$resource', function($resource){
  alert('factory');
  return $resource('/home/index.json', {}, {
    query: { method: 'GET' }
  });
}]);

MyApp.config([
  '$routeProvider', '$locationProvider', function($routeProvider, $locationProvider) {
    alert('config');
    $routeProvider.when('Home', {
      templateUrl: 'templates/home/index.html',
      controller: 'HomeListCtr'
    });

    $routeProvider.otherwise({
      redirectTo: '/home'
    });
  }
]);

MyApp.controller("HomeListCtr", ['$scope', '$resource', 'Home', '$location', function($scope, $resource, Home, $location) {
  $scope.data = Home.query();
  console.log($scope.data.first.featured_spaces);
}]);
