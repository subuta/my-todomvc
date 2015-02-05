angular.module('todomvcApp')
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