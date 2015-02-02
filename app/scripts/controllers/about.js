'use strict';

/**
 * @ngdoc function
 * @name todomvcApp.controller:AboutCtrl
 * @description
 * # AboutCtrl
 * Controller of the todomvcApp
 */
angular.module('todomvcApp')
  .controller('AboutCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
