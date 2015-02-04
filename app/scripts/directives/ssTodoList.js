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
  }).directive('ssTodoListInput', function() {
    return {
      template: '<div class="todo-form-input-wrapper">\n  <div class="todo-form-leftbar"></div>\n  <div class="todo-form-topbar"></div>\n  <image src="images/down-arrow.png" class="todo-form-down-arrow" ng-class="{\'is-completed\': isAllCompleted()}" ng-click="toggleAllCompleted()" ng-show="todos.length > 0"></image>\n  <input class="todo-form-input" placeholder="What needs to be done?" ng-class="{\'is-blank\': isBlank(task),\'left-spaced\': todos.length == 0}" ng-keyup="onKeyPress($event.keyCode)" ng-model="task" />\n</div>',
      scope: {
        todos: '='
      },
      replace: false,
      controller: function($scope, todoService) {
        $scope.task = "";
        $scope.isBlank = s.isBlank;
        $scope.addTodo = function(task) {
          if (task == null) {
            task = "";
          }
          if (!(s.isBlank(task))) {
            todoService.addTodo(task);
            return $scope.task = "";
          }
        };
        $scope.onKeyPress = function(keyCode) {
          switch (keyCode) {
            case 13:
              return $scope.addTodo($scope.task);
            case 27:
              return $scope.task = "";
          }
        };
        $scope.isAllCompleted = todoService.isAllCompleted;
        $scope.toggleAllCompleted = todoService.toggleAllCompleted;
        return $scope.asAllCompleted = todoService.asAllCompleted;
      },
      restrict: 'E'
    };
  }).directive('ssTodoListItem', function() {
    return {
      template: '<div class="todo-list-item" ng-mouseover="hoverIn(todo)" ng-mouseleave="hoverOut(todo)" ng-repeat="todo in todos | filter:getFilter()">\n  <span class="todo-form-check" ng-class="{\'is-completed\': todo.isCompleted}" ng-click="todo.toggleCompleted()">✓</span>\n  <div class="todo-form-leftbar-short"></div>\n  <span class="todo-form-remove pull-right" ng-click="removeTodo(todo)" ng-show="todo.hover">×</span>\n  <div ng-switch="todo.editable">\n    <div ng-switch-when="true">\n      <div class="todo-list-task"  ng-class="{\'is-completed\': todo.isCompleted}" ng-bind=""></div>\n      <input class="todo-form-input" ng-keyup="sonKeyPress($event.keyCode, todo)" ng-model="todo.task" />\n    </div>\n    <div ng-switch-when="false">\n      <div class="todo-list-task"  ng-class="{\'is-completed\': todo.isCompleted}" ng-bind="todo.task" ng-dblclick="todo.edit()"></div>\n    </div>\n  </div>\n</div>',
      scope: {
        todosFilter: '=',
        todos: '='
      },
      replace: false,
      controller: function($scope, todoService) {
        $scope.removeTodo = function(todo) {
          todoService.removeTodo(todo);
          return $scope.todos = todoService.todos;
        };
        $scope.hoverIn = function(todo) {
          return todo.hover = true;
        };
        $scope.hoverOut = function(todo) {
          return todo.hover = false;
        };
        $scope.getFilter = function() {
          var filter;
          filter = {};
          switch ($scope.todosFilter) {
            case 'completed':
              filter = {
                isCompleted: true
              };
              break;
            case 'notCompleted':
              filter = {
                isCompleted: false
              };
          }
          return filter;
        };
        return $scope.sonKeyPress = function(keyCode, todo) {
          if (keyCode && todo) {
            switch (keyCode) {
              case 13:
                return todo.endEdit();
              case 27:
                return todo.endEdit(true);
            }
          }
        };
      },
      restrict: 'E'
    };
  }).directive('ssTodoListFooter', function() {
    return {
      template: '<div class="todo-form-footer-wrapper">\n  <div class="todo-form-footer">\n    <span class="footer-left"><b>{{getNotCompleted().length}}</b> items left</span>\n    <span class="footer-right">\n      <button class="btn-small" ng-click="clearCompleted()" ng-show="getCompleted().length > 0">Clear completed ({{getCompleted().length}})</button>\n    </span>\n    <div class="todo-form-filters">\n      <span ng-click="todosFilter = \'\'" ng-class="{\'is-selected\': todosFilter === \'\'}">All</span>\n      <span ng-click="todosFilter = \'notCompleted\'" ng-class="{\'is-selected\': todosFilter === \'notCompleted\'}">Active</span>\n      <span ng-click="todosFilter = \'completed\'" ng-class="{\'is-selected\': todosFilter === \'completed\'}">Completed</span>\n    </div>\n  </div>\n</div>',
      scope: {
        todosFilter: '=',
        todos: '='
      },
      replace: false,
      controller: function($scope, todoService) {
        $scope.getCompleted = todoService.getCompleted;
        $scope.getNotCompleted = todoService.getNotCompleted;
        return $scope.clearCompleted = function() {
          todoService.clearCompleted();
          return $scope.todos = todoService.todos;
        };
      },
      restrict: 'E',
      link: function(scope, element, attrs) {}
    };
  }).directive('ssTodoList', function() {
    return {
      template: '<div class="todo-form-wrapper" ng-controller="todoListCtrl as vm">\n  <div class="todo-form">\n    <ss-todo-list-input todos="vm.todos"></ss-todo-list-input>\n    <ss-todo-list-item todos-filter="vm.todosFilter" todos="vm.todos"></ss-todo-list-item>\n    <ss-todo-list-footer todos-filter="vm.todosFilter" todos="vm.todos"></ss-todo-list-footer>\n  </div>\n</div>',
      restrict: 'E',
      scope: true,
      replace: true
    };
  });

}).call(this);

//# sourceMappingURL=ssTodoList.js.map
