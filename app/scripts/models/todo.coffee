# Todo向けのクラス
class Todo

  constructor: (@taskName = "", @isCompleted = false, @id = null) ->
    @_editable = false

  # アンダーバーでプレフィックスされてないプロパティのみを取得するメソッド
  pickProperties: ->
    properties = _.reject(_.keys(@), (key) -> s.startsWith(key, '_') )
    return _.pick(@, properties)

  @parse: (obj) ->
    return new Todo(obj.taskName, obj.isCompleted, obj.id)

angular.module('todomvcApp').constant('Todo', Todo)