var app = angular.module("myApp", []);

app.controller("RometicaCtrl", ["$scope", "$timeout", function($scope, $timeout){
  // Scope variables //////////////////////////

  $scope.panes = [[29, 4, 25, 32, 9, 31, 12, 10, 24], [13, 11, 2, 19, 7, 25, 3, 33, 34], [24, 5, 19, 27, 18, 4, 12, 34, 26], [17, 8, 9, 5, 7, 6, 29, 32, 31], [27, 2, 25, 32, 16, 24, 13, 21, 28], [9, 5, 4, 16, 3, 17, 32, 10, 31], [21, 2, 19, 22, 7, 30, 18, 6, 31], [25, 10, 15, 21, 29, 13, 1, 7, 27], [30, 14, 16, 19, 20, 7, 31, 29, 8], [19, 14, 5, 3, 10, 27, 18, 26, 20], [35, 11, 24, 4, 10, 26, 12, 19, 27], [29, 19, 10, 17, 25, 13, 31, 22, 33], [33, 10, 23, 28, 1, 17, 4, 26, 8], [22, 19, 3, 26, 18, 27, 6, 35, 11], [10, 1, 9, 12, 31, 29, 7, 33, 18], [9, 4, 5, 31, 18, 15, 7, 29, 28], [13, 11, 2, 3, 21, 35, 31, 12, 7], [27, 23, 4, 29, 9, 28, 16, 15, 34], [11, 6, 5, 3, 22, 34, 4, 24, 32], [11, 6, 5, 19, 31, 27, 15, 35, 18], [21, 2, 19, 28, 27, 11, 24, 34, 18], [20, 2, 18, 14, 29, 3, 28, 33, 7], [18, 1, 17, 22, 6, 25, 33, 29, 2], [15, 1, 14, 19, 30, 21, 3, 28, 32], [8, 5, 3, 34, 27, 17, 28, 15, 16], [11, 9, 2, 24, 1, 34, 29, 21, 16], [27, 4, 23, 13, 8, 32, 29, 7, 18], [22, 4, 18, 21, 31, 19, 33, 34, 20], [25, 7, 18, 14, 16, 10, 20, 31, 33], [18, 5, 13, 34, 26, 22, 33, 2, 10], [32, 7, 25, 1, 22, 5, 19, 9, 35], [17, 6, 11, 2, 26, 35, 31, 1, 21], [8, 3, 5, 24, 9, 22, 26, 10, 28], [24, 17, 7, 25, 15, 21, 30, 35, 29], [11, 8, 3, 16, 28, 18, 6, 1, 30], [25, 4, 21, 10, 7, 22, 24, 16, 19], [19, 15, 4, 8, 28, 31, 33, 21, 22], [35, 26, 9, 4, 16, 11, 18, 1, 21], [7, 6, 1, 24, 9, 21, 29, 32, 34], [21, 12, 9, 5, 20, 35, 19, 22, 6], [21, 9, 12, 28, 29, 24, 26, 27, 34], [27, 24, 3, 10, 32, 23, 15, 19, 31], [24, 11, 13, 29, 4, 1, 6, 8, 26], [30, 17, 13, 33, 12, 8, 27, 32, 7], [35, 16, 19, 22, 23, 2, 8, 26, 32], [23, 5, 18, 26, 4, 10, 7, 32, 34], [31, 27, 4, 21, 19, 20, 29, 14, 32], [7, 4, 3, 21, 35, 5, 27, 13, 29], [11, 10, 1, 24, 33, 26, 18, 5, 20], [33, 26, 7, 14, 8, 30, 2, 13, 29], [24, 20, 4, 18, 34, 26, 11, 3, 25], [15, 4, 11, 3, 29, 27, 10, 9, 22], [15, 7, 8, 21, 26, 30, 12, 24, 35], [32, 30, 2, 11, 25, 1, 16, 20, 35], [31, 3, 28, 35, 10, 11, 19, 23, 27], [33, 5, 28, 26, 32, 22, 13, 16, 25], [34, 7, 27, 28, 24, 12, 29, 9, 11], [30, 7, 23, 29, 8, 32, 4, 13, 18], [10, 1, 9, 18, 24, 29, 35, 16, 31], [34, 20, 14, 24, 25, 28, 17, 27, 19], [7, 5, 2, 4, 19, 32, 33, 16, 22], [15, 5, 10, 18, 26, 6, 29, 2, 30], [9, 6, 3, 23, 21, 11, 16, 1, 33], [26, 20, 6, 31, 29, 12, 16, 33, 34], [30, 26, 4, 15, 23, 28, 10, 12, 21], [18, 15, 3, 35, 19, 13, 27, 26, 25], [31, 13, 18, 12, 34, 11, 26, 28, 27], [22, 14, 8, 24, 4, 15, 31, 34, 33], [10, 7, 3, 6, 19, 24, 2, 28, 20], [15, 5, 10, 1, 26, 30, 28, 24, 7]];
  $scope.selected = [];
  $scope.target;
  $scope.currentPane = getPane();

  // Scope methods /////////////////////////////


  $scope.toggleSelected = function() {
      var selected = isSelected( this.cell);
      $timeout(function(){
        if( isSolved() ) loadPuzzle();
      });
      return selected;
  };

  // Private methods ///////////////////////////

  function formatPane( pane ){
      // set target number for current pane
      $scope.target = pane[0];
      console.log("Target is: " + $scope.target );

      pane = shuffle( pane );

      // format pane as an array of arrays where 
      // each sub-array contains 3 cells
      var currentPane = [];
      for(var i = 0; i < 9; i = i + 3){
        currentPane.push([pane[i], pane[i+1], pane[i+2]])
      }
      return currentPane;
  };


  function shuffle( sourceArray ){
      var sourceCopy = sourceArray.slice(0,9); // shallow copy because we are splicing later
      var returnArray = [];

      while( sourceCopy.length > 0 ){
        var index = Math.floor(Math.random() * sourceCopy.length);
        returnArray.push( sourceCopy.splice(index, 1)[0] );
      }
      return returnArray;
  };


  function getPane(){
      // select random pane
      var index = Math.floor(Math.random() * $scope.panes.length);
      // return formatted pane
      return formatPane( $scope.panes[index] );
  };

  
  function isSelected ( selectedNumber ){
      var selected = false;
      var indexOfSelected = $scope.selected.indexOf( selectedNumber );

      if( indexOfSelected < 0 ){
        $scope.selected.push( selectedNumber );
        selected = true;
      }
      else{
        $scope.selected.splice( indexOfSelected, 1);
      }
      return selected;
  };


  function isSolved(){
     var sum = 0;
     var solved = false;

     angular.forEach($scope.selected, function( num ){ 
       sum += num; 
     });

     if( sum == $scope.target ) solved = true;
     return solved;
  };


  function loadPuzzle(){
     runFadeAnimation();
     $timeout(function(){
        loadNextPane();
      }, 5000);
  };

 
  function runFadeAnimation(){
      var unselectedTiles = $(".tile-data:not(:contains('"+ $scope.target +"'))").not(".selected");
      $(unselectedTiles).fadeTo(3000, 0.2);
  };


  function loadNextPane(){
      var unselectedTiles = $(".tile-data:not(:contains('"+ $scope.target +"'))").not(".selected");
      $(unselectedTiles).fadeTo(0, 1);
      $(".selected").trigger("click");
      $scope.currentPane = getPane();
  };

 }]);

