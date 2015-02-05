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
