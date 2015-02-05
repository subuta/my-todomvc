casper.test.begin("TODOのフィルタ表示テスト", 11, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
  )

  casper.then( () ->
    @addTodo('Go to buy a iMac')
    @addTodo('Go to buy a MacBook Pro')
    @addTodo('Go to buy a Mac Mini')
    test.assertElementCount('.todo-list-item', 3,'３つのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-form-footer .footer-left', '3 items left', 'アイテム数の表示が３となっていること')
    test.assertSelectorHasText('#todo-form-filter-all.is-selected', 'All', 'Allフィルタが選択されていること')

    test.info("最初のタスクを完了済みとしたら")
    @mouse.click('.todo-list-item:first-child .todo-form-check')
  )

  casper.then( () ->
    test.assertElementCount('.todo-list-item', 3,'３つのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-form-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること')

    test.info("フィルタをActiveとしたら")
    @mouse.click('#todo-form-filter-active')

    @waitForSelector('#todo-form-filter-active.is-selected', () ->
      test.assertElementCount('.todo-list-item', 2,'２つのTODOタスクが表示されていること')
      test.assertSelectorHasText('.todo-form-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること')
      test.assertSelectorHasText('.todo-list-item:first-child .todo-list-task', 'Go to buy a MacBook Pro', '表示されているタスクが想定どおりのタスクで有ること')
    )
  )

  casper.then( () ->
    test.info("フィルタをCompletedとしたら")
    @mouse.click('#todo-form-filter-completed')

    @waitForSelector('#todo-form-filter-completed.is-selected', () ->
      test.assertElementCount('.todo-list-item', 1,'１つのTODOタスクが表示されていること')
      test.assertSelectorHasText('.todo-form-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること')
      test.assertSelectorHasText('.todo-list-item:first-child .todo-list-task', 'Go to buy a iMac', '表示されているタスクが想定どおりのタスクで有ること')
    )
  )

  casper.run(() ->
    test.done()
  )
)