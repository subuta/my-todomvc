'use strict'

###*
 # @ngdoc function
 # @name todomvcApp.controller:TodoCtrl
 # @description
 # # TodoCtrl
 # Controller of the Todoページ用のコントローラ
###
angular.module('todomvcApp')
  .controller 'TodoCtrl', ($scope, $filter, _, s, Todo) ->
    # thisをVM(ViewModel)として定義
    vm = @

    # フィルタの初期状態を空にしておく。
    vm.todosFilter = ""

    # todoの一覧を取得
    vm.todos = Todo.gets()

    # 完了済みのTodoを取得するメソッド
    vm.getCompleted = ->
      $filter('filter')(vm.todos, {isCompleted: true})
    # Todoがすべて完了済みかどうかを取得するメソッド
    vm.isAllCompleted = ->
      _.every vm.todos, (todo) ->
        todo.isCompleted
    # Todoをすべて完了済みとするメソッド
    vm.asAllCompleted = ->
      vm.todos = _.map vm.todos, (todo) ->
        todo.isCompleted = true
        return todo

    # Todoの完了済みをトグルするメソッド
    vm.toggleAllCompleted = ->
      if vm.isAllCompleted()
        # 既にすべて完了済みならトグルする。
        vm.todos = _.map vm.todos, (todo) ->
          todo.isCompleted = !todo.isCompleted
          return todo
      else
        # 完了済みでないなら、すべて完了済みにする。
        vm.asAllCompleted()

    # Todoが空かどうかを返却するメソッド
    vm.isEmpty = ->
      vm.todos.length == 0

    # 未完了のTodoを取得するメソッド
    vm.getNotCompleted = ->
      $filter('filter')(vm.todos, {isCompleted: false})

    # 完了済みのTodoを削除するメソッド
    vm.clearCompleted = ->
      # 完了済み(isCompleted = true)を除いたコレクションを返却する。
      _.each(vm.todos, (todo) ->
        todo.delete() if todo.isCompleted
      )
      # todoの一覧を取得
      vm.todos = Todo.gets()

    # taskNameを初期化
    vm.taskName = ""

    vm.isBlank = (taskName) ->
      s.isBlank(taskName)

    # Todoを追加するメソッド
    vm.createTodo = (taskName = "") ->
      unless s.isBlank(taskName)
        #todoService.addTodo(taskName)
        todo = new Todo(taskName)
        todo.save()
        # todoの一覧を取得
        vm.todos = Todo.gets()
        vm.taskName = ""

    # キーボードが押下された場合のハンドラ
    vm.onInputFormKeyPress = (keyCode) ->
      switch keyCode
        when 13
          vm.createTodo(vm.taskName)
        when 27
          vm.taskName = ""

    # リストへホバーした際の挙動を定義する。
    vm.hoverIn = (todo) ->
      todo.hover = true

    # リストからのホバーが外れたの挙動を定義する。
    vm.hoverOut = (todo) ->
      todo.hover = false

    # 現在のFilterを取得するメソッド
    vm.getFilter = () ->
      filter = {}
      switch vm.todosFilter
        when 'completed'
          filter = { isCompleted: true }
        when 'notCompleted'
          filter = { isCompleted: false }
      return filter

    # キーボードが押下された場合のハンドラ
    vm.onEditorKeyPress = (keyCode, todo) ->
      if keyCode and todo
        switch keyCode
          when 13
            todo.save()
            vm.endEdit(todo)
          when 27
            todo.taskName = todo.tempTask
            vm.endEdit(todo)

    vm.onTodoRemoveClicked = (todo) ->
      todo.delete()
      # todoの一覧を取得
      vm.todos = Todo.gets()

    # completedをセットする。
    vm.setCompleted = (todo, isCompleted) ->
      todo.isCompleted = isCompleted

    # completedをトグルする。
    vm.toggleCompleted = (todo) ->
      todo.isCompleted = !todo.isCompleted

    # Todoを編集状態にする。
    vm.edit = (todo) ->
      todo.editable = true
      todo.tempTask = todo.taskName

    # Todoの編集状態を終了する。
    vm.endEdit = (todo) ->
      todo.editable = false