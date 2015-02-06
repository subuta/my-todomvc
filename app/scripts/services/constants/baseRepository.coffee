# Model向けのベースクラス
class BaseRepository

  url: 'http://localhost:3000/api/'

  constructor: ->
    angular.noop()

  save: (entity) ->
    if (entity.id)
      @update(entity)
    else
      @create(entity)

  create: (entity) ->
    angular.noop()

  update: (entity) ->
    angular.noop()

  delete: (entity) ->
    angular.noop()

  get: (id) ->
    angular.noop()
  gets: ->
    angular.noop()

angular.module('todomvcApp').constant('BaseRepository', BaseRepository)