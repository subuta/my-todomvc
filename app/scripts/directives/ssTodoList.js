// Generated by CoffeeScript 1.9.0
(function() {
  'use strict';

  /**
    * @ngdoc directive
    * @name todomvcApp.directive:ssTodoList
    * @description
    * # Todo一覧表示用のディレクティブ
   */
  angular.module('todomvcApp').controller('todoListCtrl', function(todoService) {
    var vm;
    vm = this;
    vm.todosFilter = "";
    return vm.todos = todoService.todos;
  }).directive('ssTodoList', function() {
    return {
      templateUrl: 'views/directives/ssTodoList.html',
      restrict: 'E',
      scope: true,
      replace: true
    };
  });

}).call(this);

//# sourceMappingURL=ssTodoList.js.map
