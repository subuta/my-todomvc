casper.test.begin("TODOの追加テスト", 7, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
  )

  casper.then( () ->
    test.info("タスクを１つ追加したら")
    @addTodo('Go to buy a iMac')
    test.assertVisible('.todo-form-down-arrow', '矢印マークが表示されていること')
    test.assertExists('.todo-list-item .todo-form-check', 'チェックマークが表示されていること')
    test.assertElementCount('.todo-list-item', 1,'ひとつのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-list-item .todo-list-task', 'Go to buy a iMac','TODOタスクの中身が表示されていること')
    test.assertNotVisible('.todo-list-item .todo-form-remove', '削除マークが表示されていないこと')
    test.assertSelectorHasText('.todo-form-footer .footer-left', '1 items left', 'アイテム数の表示が1となっていること')
  );

  casper.then( () ->
    test.info("タスクにホバーしたら")
    @mouse.move('.todo-list-item .todo-list-task')
    test.assertVisible('.todo-list-item .todo-form-remove', '削除マークが表示されていること')
  );

  casper.run(() ->
    test.done()
  );
)