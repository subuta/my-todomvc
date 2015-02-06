casper.test.begin("TODOのフィルタ表示テスト", 9, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
  )

  casper.then( () ->
    @addTodo('Go to buy a iMac')
    @addTodo('Go to buy a MacBook Pro')
    @addTodo('Go to buy a Mac Mini')
    test.assertElementCount('.todo-list-item', 3,'３つのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-footer .footer-left', '3 items left', 'アイテム数の表示が３となっていること')
    test.assertSelectorHasText('#todo-form-filter-all.is-selected', 'All', 'Allフィルタが選択されていること')
  )
  
  casper.then( () ->
    test.info("最初のタスクを完了済みとしたら")
    @mouse.click('.todo-list-item .todo-form-check')

    test.assertElementCount('.todo-list-item', 3,'３つのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること')
  )

  casper.then( () ->
    test.info("フィルタをActiveとしたら")
    @clickLabel('Active', 'span')

    @waitForSelector('#todo-form-filter-active.is-selected', () ->
      test.assertElementCount('.todo-list-item', 2,'２つのTODOタスクが表示されていること')
      test.assertSelectorHasText('.todo-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること')
    )
  )

  casper.then( () ->
    test.info("フィルタをCompletedとしたら")
    @clickLabel('Completed', 'span')

    @waitForSelector('#todo-form-filter-completed.is-selected', () ->
      test.assertElementCount('.todo-list-item', 1,'１つのTODOタスクが表示されていること')
      test.assertSelectorHasText('.todo-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること')
    )
  )

  casper.run(() ->
    test.done()
  )
)