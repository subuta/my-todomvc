# Model向けのベースクラス
class Base

  constructor: ->

  @url: 'http://localhost:3000/api/'

  save: ->
    if (@id)
      @update()
    else
      @create()

  create: ->
  update: ->
  delete: ->

  @get: (id) ->
  @gets: ->

angular.module('todomvcApp').constant('Base', Base)