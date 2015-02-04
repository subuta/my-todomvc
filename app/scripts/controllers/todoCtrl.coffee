'use strict'

###*
 # @ngdoc function
 # @name todomvcApp.controller:TodoCtrl
 # @description
 # # TodoCtrl
 # Controller of the Todoページ用のコントローラ
###
angular.module('todomvcApp')
  .controller 'TodoCtrl', ($scope, todoService) ->
    # thisをVM(ViewModel)として定義
    vm = @