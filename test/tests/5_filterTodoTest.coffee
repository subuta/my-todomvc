casper.test.begin("TODOのフィルタ表示テスト", 100, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
  )

  casper.then( () ->
    @addTodo('Go to buy a iMac')
    @addTodo('Go to buy a MacBook Pro')
    @addTodo('Go to buy a Mac Mini')
    test.assertElementCount('.todo-list-item', 3,'３つのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-form-footer .footer-left', '3 items left', 'アイテム数の表示が３となっていること')
    test.assertSelectorHasText('.todo-form-filters .is-selected', 'All', 'Allフィルタが選択されていること')

    test.info("最初のタスクを完了済みとしたら")
    @mouse.click('.todo-list-item:first-child .todo-form-check')
  )

  casper.then( () ->
    test.assertElementCount('.todo-list-item', 3,'３つのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-form-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること')

#    test.info("フィルタをActiveとしたら")
#    @mouse.click('.todo-form-filters span[text()]')
    #TODO: フィルタ関連のテストの実装の続き
  )

  casper.then( () ->
    @captureEvidence('test')
  )

  casper.run(() ->
    test.done()
  )
)