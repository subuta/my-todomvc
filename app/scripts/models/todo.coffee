# Todo向けのクラス
class Todo
  constructor: (@task = "", @isCompleted = false, @editable = false) ->

    # 自身のtaskプロパティのセッター
  setTask: (task) ->
    @task = task

  # completedをセットする。
  setCompleted: (isCompleted) ->
    @isCompleted = isCompleted

  # completedをトグルする。
  toggleCompleted: () ->
    @isCompleted = !@isCompleted

  # Todoを編集状態にする。
  edit: ->
    @editable = true
    @tempTask = @task

  # Todoの編集状態を終了する。
  endEdit: (isCancel = false) ->
    @editable = false
    @task = @tempTask if (isCancel)


angular.module('todomvcApp').constant('Todo', Todo)