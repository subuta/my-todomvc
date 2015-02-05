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
    templateUrl: '../../views/directives/ssTodoList.html'
    restrict: 'E',
    scope: true,
    replace: true
  )
