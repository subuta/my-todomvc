'use strict'

###*
 # @ngdoc service
 # @name todomvcApp.todoService
 # @description
 # # todoService
 # Singletonなtodo機能のインスタンスを提供するFactoryです。
###
angular.module('todomvcApp')
  .factory 'todoService', ($filter, Todo) ->

    # todoServiceの定義
    todoService = {
      # Todo一覧の定義
      todos: []
      # Todoを追加するメソッド
      addTodo: (task) ->
        @todos.push(new Todo(task))
      # Todoを追加するメソッド
      removeTodo: (todo) ->
        @todos = _.without(@todos, todo)
      # 完了済みのTodoを取得するメソッド
      getCompleted: () ->
        $filter('filter')(@todos, {isCompleted: true})
      # Todoがすべて完了済みかどうかを取得するメソッド
      isAllCompleted: () ->
        _.every(@todos, (todo) -> todo.isCompleted)
      # Todoをすべて完了済みとするメソッド
      asAllCompleted: () ->
        _.map(@todos, (todo) ->
          todo.isCompleted = true
          return todo
        )
      # Todoの完了済みをトグルするメソッド
      toggleAllCompleted: () ->
        if @isAllCompleted()
          # 既にすべて完了済みならトグルする。
          _.map(@todos, (todo) ->
            todo.isCompleted = !todo.isCompleted
            return todo
          )
        else
          # 完了済みでないなら、すべて完了済みにする。
          @asAllCompleted()

      # 未完了のTodoを取得するメソッド
      getNotCompleted: () ->
        $filter('filter')(@todos, {isCompleted: false})
      # 完了済みのTodoを削除するメソッド
      clearCompleted: () ->
        # 完了済み(isCompleted = true)を除いたコレクションを返却する。
        @todos = _.reject(@todos, (todo) -> return todo.isCompleted )
    }

    return todoService
