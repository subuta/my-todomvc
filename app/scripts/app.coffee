'use strict';

###
 * @ngdoc overview
 * @name todomvcApp
 * @description
 * # todomvcApp
 *
 * Main module of the application.
###

angular.module('todomvcApp', [
    'ngAnimate',
    'ngCookies',
    'ngMessages',
    'ngResource',
    'ngRoute',
    'ngSanitize',
    'ngTouch'
  ])
.config( ($routeProvider) ->
  $routeProvider
    .when('/', {
      templateUrl: 'views/main.html',
      controller: 'MainCtrl'
    })
    .otherwise({
        redirectTo: '/'
      });
);
