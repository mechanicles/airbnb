var MyApp = angular.module('airbnb', []);


MyApp.filter("sanitize", ['$sce', function($sce) {
  return function(htmlCode){
    return $sce.trustAsHtml(htmlCode);
  }
}]);

MyApp.controller("HomeController", ['$scope', '$http', function($scope, $http) {
  $http.get('/home/index.json')
    .then(function(response) {
      $scope.data = response.data;
      $scope.featured_spaces = $scope.data.featured_spaces;
      $scope.unfeatured_spaces = $scope.data.unfeatured_spaces;

      $scope.availbility = function(space) {
        if(space.total_seats_booked) {
          return "<b> All seats are booked! </b>";
        } else if(space.space_booked_by_current_user) {
          return "<b> You have booked this place! </b>";
        } else {
          return "<b> <a href='/shared_office_space/detail?space_id="+space.id +"'>Available</a></b>";
        }
      };

      console.log($scope.featured_spaces);
      console.log($scope.unfeatured_spaces);
    });

}]);
