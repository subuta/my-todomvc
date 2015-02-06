'use strict'

###
 * @ngdoc overview
 * @name todomvcApp
 * @description
 * # todomvcApp
 *
 * TodoMVCAppのエントリーポイント
###

angular.module('todomvcApp')
  .run( () ->

  )

# グローバル変数に存在するライブラリをAngularJSのモジュールとして取り込む
angular.module('todomvcApp').constant('_', _)
angular.module('todomvcApp').constant('s', s)