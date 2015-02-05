angular.module('todomvcApp')
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