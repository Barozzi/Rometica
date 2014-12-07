var App = angular.module("Rometica", []);


App.controller("RometicaCtrl", ["$scope", function(){
  $scope.target; // this gets updated on each new pane.
  $scope.panes; // this is imported data from the server. Lets just load the whole dataset all at once, then the user can play away.

  // methods
  $scope.success = function(){
  };

  $scope.reset = function(){
  };
 

}]);

// checks to see how many tiles are selected besides self
// if more than 0 other tiles then get sum and compare it to
// target. If equal to target, then run SUCCESS
// if not equal, then clear all selected.
//
App.directive("selected", function(){
});
