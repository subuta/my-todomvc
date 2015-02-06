casper.test.begin("TODOの削除テスト", 8, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
  )

  casper.then( () ->
    @addTodo('Go to buy a iMac')

    @waitForSelector('.todo-list-item .todo-list-task', () ->
      test.assertVisible('.todo-form-toggle-complete', '矢印マークが表示されていること')
      test.assertExists('.todo-list-item .todo-form-check', 'チェックマークが表示されていること')
      test.assertElementCount('.todo-list-item', 1,'ひとつのTODOタスクが表示されていること')
      test.assertSelectorHasText('.todo-list-item .todo-list-task', 'Go to buy a iMac','TODOタスクの中身が表示されていること')
      test.assertNotVisible('.todo-list-item .todo-form-remove', '削除マークが表示されていないこと')
      test.assertSelectorHasText('.todo-footer .footer-left', '1 items left', 'アイテム数の表示が1となっていること')
    )
  )

  casper.then( () ->
    test.info("タスクを完了済みとしたら")
    @mouse.click('.todo-list-item .todo-form-check')

    test.info("タスクを削除したら")
    @waitForSelector('.todo-footer-wrapper .todo-footer .footer-right .btn-small', () ->
      @evaluate(() ->
        document.querySelector('.todo-footer-wrapper .todo-footer .footer-right .btn-small').click()
      )
    )
    @waitWhileVisible('.todo-footer-wrapper .todo-footer .footer-right .btn-small', () ->
      test.assertNotVisible('.todo-footer-wrapper .todo-footer .footer-right .btn-small', '\'Clear completed\'ボタンが非表示となっていること')
      test.assertSelectorHasText('.todo-footer .footer-left', '0 items left', 'アイテム数の表示が0となっていること')
    )
  )

  casper.run(() ->
    test.done()
  )
)