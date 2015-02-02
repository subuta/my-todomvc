'use strict';

/**
 * @ngdoc function
 * @name todomvcApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the todomvcApp
 */
angular.module('todomvcApp')
  .controller('MainCtrl', function ($scope) {
    $scope.awesomeThings = [
      'HTML5 Boilerplate',
      'AngularJS',
      'Karma'
    ];
  });
