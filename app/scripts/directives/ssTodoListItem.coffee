angular.module('todomvcApp')
# TodoListの一覧要素
.directive('ssTodoListItem', ->
  templateUrl: '../../views/directives/ssTodoListItem.html'
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
