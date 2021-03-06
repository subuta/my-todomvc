angular.module('todomvcApp').factory('TodoRepository', (BaseRepository, Todo) ->
  # Todo向けのクラス
  class TodoRepository extends BaseRepository

    id : 1
    url: 'http://localhost:3000/api/todo'
    todos: []

    constructor: ->
      super()

    create: (todo) ->
      todo = Todo.parse(todo)
      @_setAndIncrementId(todo)
      @todos.push(todo)

    update: (todo)->
      angular.noop(todo)

    delete: (todo) ->
      @todos = _.reject @todos, (_todo) ->
        _todo.id == todo.id

    _setAndIncrementId: (todo) ->
      todo.id = @id
      @id++

    get: (id) ->
      return @todos[id]

    gets: ->
      return @todos

  return new TodoRepository()
)