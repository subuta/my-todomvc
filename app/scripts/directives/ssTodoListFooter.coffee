angular.module('todomvcApp')
# TodoListのフッター要素
.directive('ssTodoListFooter', ->
  templateUrl: 'views/directives/ssTodoListFooter.html'
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