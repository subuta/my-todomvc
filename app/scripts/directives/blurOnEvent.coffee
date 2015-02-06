'use strict'

###*
 # @ngdoc function
 # @name todomvcApp.controller:TodoCtrl
 # @description
 # # TodoCtrl
 # scopeでのイベント発生時に要素からblurするディレクティブ
###
angular.module('todomvcApp')
.directive 'blurOnEvent', () ->
  return {
    restrict: 'A',
    link: (scope, elem, attr) ->
      event = attr.blurOnEvent
      if (event)
        scope.$on(event, () -> elem.trigger('blur') )
  }