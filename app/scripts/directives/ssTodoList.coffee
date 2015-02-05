'use strict'

###*
 # @ngdoc directive
 # @name todomvcApp.directive:ssTodoList
 # @description
 # # Todo一覧表示用のディレクティブ
###
angular.module('todomvcApp')
  # ディレクティブ向けのコントローラ
  .controller('todoListCtrl', (todoService) ->
    # thisをVM(ViewModel)として定義
    vm = @

    # フィルタの初期状態を空にしておく。
    vm.todosFilter = ""

    # todoの一覧を取得
    vm.todos = todoService.todos
  )
  # Todo追加のフォーム
  .directive('ssTodoListInput', ->
    template: '''
    <div class="todo-form-input-wrapper">
      <div class="todo-form-leftbar"></div>
      <div class="todo-form-topbar"></div>
      <image src="images/down-arrow.png" class="todo-form-down-arrow" ng-class="{'is-completed': isAllCompleted()}" ng-click="toggleAllCompleted()" ng-show="todos.length > 0"></image>
      <input class="todo-form-input" placeholder="What needs to be done?" ng-class="{'is-blank': isBlank(task),'left-spaced': todos.length == 0}" ng-keyup="onKeyPress($event.keyCode)" ng-model="task" />
    </div>
    ''',
    scope: {
      todos: '='
    },
    replace: false,
    controller: ($scope, todoService) ->
      # taskを初期化
      $scope.task = ""

      # VMからUnderScoreJSの関数を参照できるようにする。
      $scope.isBlank = s.isBlank

      # Todoを追加するメソッド
      $scope.addTodo = (task = "") ->
        unless (s.isBlank(task))
          todoService.addTodo(task)
          $scope.task = ""

      # キーボードが押下された場合のハンドラ
      $scope.onKeyPress = (keyCode) ->
        switch keyCode
          when 13
            $scope.addTodo($scope.task)
          when 27
            $scope.task = ""

      # TODOの完了済みに関する関数を取得しておく。
      $scope.isAllCompleted = todoService.isAllCompleted
      $scope.toggleAllCompleted = todoService.toggleAllCompleted
      $scope.asAllCompleted = todoService.asAllCompleted

    restrict: 'E'
  )
  # TodoListの一覧要素
  .directive('ssTodoListItem', ->
    template: '''
    <div class="todo-list-item" ng-mouseover="hoverIn(todo)" ng-mouseleave="hoverOut(todo)" ng-repeat="todo in todos | filter:getFilter()">
      <span class="todo-form-check" ng-class="{'is-completed': todo.isCompleted}" ng-click="todo.toggleCompleted()">✓</span>
      <div class="todo-form-leftbar-short"></div>
      <span class="todo-form-remove pull-right" ng-click="removeTodo(todo)" ng-show="todo.hover">×</span>
      <div ng-switch="todo.editable">
        <div ng-switch-when="true">
          <div class="todo-list-task"  ng-class="{'is-completed': todo.isCompleted}" ng-bind=""></div>
          <input class="todo-form-input" ng-keyup="onKeyPress($event.keyCode, todo)" ng-model="todo.task" />
        </div>
        <div ng-switch-when="false">
          <div class="todo-list-task"  ng-class="{'is-completed': todo.isCompleted}" ng-bind="todo.task" ng-dblclick="todo.edit()"></div>
        </div>
      </div>
    </div>
    ''',
    scope: {
      todosFilter: '=',
      todos: '='
    },
    replace: false,
    controller: ($scope, todoService) ->
      # Todoを削除するメソッド
      $scope.removeTodo = (todo) ->
        todoService.removeTodo(todo)
        $scope.todos = todoService.todos

      # リストへホバーした際の挙動を定義する。
      $scope.hoverIn = (todo) ->
        todo.hover = true

      # リストからのホバーが外れたの挙動を定義する。
      $scope.hoverOut = (todo) ->
        todo.hover = false

      # 現在のFilterを取得するメソッド
      $scope.getFilter = () ->
        filter = {}
        switch $scope.todosFilter
          when 'completed'
            filter = { isCompleted: true }
          when 'notCompleted'
            filter = { isCompleted: false }
        return filter

      # キーボードが押下された場合のハンドラ
      $scope.onKeyPress = (keyCode, todo) ->
        if keyCode and todo
          switch keyCode
            when 13
              todo.endEdit()
            when 27
              todo.endEdit(true)

    restrict: 'E'
  )
  # TodoListのフッター要素
  .directive('ssTodoListFooter', ->
    template: '''
      <div class="todo-form-footer-wrapper">
        <div class="todo-form-footer">
          <span class="footer-left"><b>{{getNotCompleted().length}}</b> items left</span>
          <span class="footer-right">
            <button class="btn-small" ng-click="clearCompleted()" ng-show="getCompleted().length > 0">Clear completed ({{getCompleted().length}})</button>
          </span>
          <div class="todo-form-filters">
            <span ng-click="todosFilter = ''" ng-class="{'is-selected': todosFilter === ''}" id="todo-form-filter-all">All</span>
            <span ng-click="todosFilter = 'notCompleted'" ng-class="{'is-selected': todosFilter === 'notCompleted'}" id="todo-form-filter-active">Active</span>
            <span ng-click="todosFilter = 'completed'" ng-class="{'is-selected': todosFilter === 'completed'}" id="todo-form-filter-completed">Completed</span>
          </div>
        </div>
      </div>
    ''',
    scope: {
      todosFilter: '=',
      todos: '='
    },
    replace: false,
    controller: ($scope, todoService) ->
      # VMからtodoService内のプロパティ/関数を参照できるようにする。
      $scope.getCompleted = todoService.getCompleted
      $scope.getNotCompleted = todoService.getNotCompleted

      # Todoを削除するメソッド
      $scope.clearCompleted = () ->
        todoService.clearCompleted()
        $scope.todos = todoService.todos

    restrict: 'E'
    link: (scope, element, attrs) ->
  )
  # TodoListの要素
  .directive('ssTodoList', ->
    template: '''
    <div class="todo-form-wrapper" ng-controller="todoListCtrl as vm">
      <div class="todo-form">
        <ss-todo-list-input todos="vm.todos"></ss-todo-list-input>
        <ss-todo-list-item todos-filter="vm.todosFilter" todos="vm.todos"></ss-todo-list-item>
        <ss-todo-list-footer todos-filter="vm.todosFilter" todos="vm.todos"></ss-todo-list-footer>
      </div>
    </div>
    '''
    restrict: 'E',
    scope: true,
    replace: true
  )
