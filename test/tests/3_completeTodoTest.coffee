casper.test.begin("TODOの完了表示テスト", 9, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
  )

  casper.then( () ->
    @addTodo('Go to buy a iMac')
    test.info("タスクを完了済みとしたら")
    @mouse.click('.todo-list-item .todo-form-check')
  )

  casper.then( () ->
    test.assertExists('.todo-list-item .todo-form-check.is-completed', 'チェックマークが完了済みの表示になっていること')
    test.assertExists('.todo-list-item .todo-list-task.is-completed', 'タスクが完了済みの表示になっていること')
    test.assertSelectorHasText('.todo-form-footer .footer-left', '0 items left', 'アイテム数の表示が0となっていること')
    test.assertVisible('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small', '\'Clear completed\'ボタンが表示されていること')
    test.assertSelectorHasText('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small', 'Clear completed (1)', 'Clear completedボタンに(1)表示が付いていること')
    test.info("矢印マークをクリックしたら")
    @mouse.click('.todo-form-down-arrow')
  )

  casper.then( () ->
    test.assertExists('.todo-list-item .todo-form-check', 'チェックマークが表示されていること')
    test.assertElementCount('.todo-list-item', 1,'ひとつのTODOタスクが表示されていること')
    test.assertSelectorHasText('.todo-list-item .todo-list-task', 'Go to buy a iMac','TODOタスクの中身が表示されていること')
    test.assertNotVisible('.todo-list-item .todo-form-remove', '削除マークが表示されていないこと')
  )

  casper.run(() ->
    test.done()
  )
)