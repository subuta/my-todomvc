'use strict'

###
 * @ngdoc overview
 * @name todomvcApp
 * @description
 * # todomvcApp
 *
 * TodoMVCAppのルーティング設定
###

angular.module('todomvcApp')
  .config( ($routeProvider) ->
    $routeProvider
      .when('/angular-todo', {
        templateUrl: '../../views/todo.html'
      })
      .otherwise({
        redirectTo: '/angular-todo'
      });
  )
