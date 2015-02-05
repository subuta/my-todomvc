angular.module('todomvcApp')
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