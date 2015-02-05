angular.module('todomvcApp').factory('Todo', (Base) ->
  # Todo向けのクラス
  class Todo extends Base

    @id : 1
    @url: 'http://localhost:3000/api/todo'
    @todos: [
#      new Todo('スーパーに行く')
#      new Todo('TSUTAYAに行く')
#      new Todo('デパートに行く')
    ]

    constructor: (@taskName = "", @isCompleted = false, @id = null, @editable = false) ->
      super()

    create: ->
      @_setAndIncrementId()
      Todo.todos.push(Todo.parse(@))

    update: ->
    delete: ->
      Todo.todos = _.reject Todo.todos, (todo) =>
        todo.id == @id

    toObj: () ->
      obj = {
        taskName: @taskName
        isCompleted: @isCompleted
      }
      return obj

    _setAndIncrementId: ->
      @id = Todo.id
      Todo.id++

    @gets: () ->
      return Todo.todos

    @get: (id) ->
      return Todo.todos[id]

    @parse: (obj) ->
      return new Todo(obj.taskName, obj.isCompleted, obj.id)

  return Todo
)