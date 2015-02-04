casper.test.begin("TODOページの表示テスト", 6, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
    test.info("ページを表示したら")
    test.assertTitle("TodoMVC", "タイトルが\'TodoMVC\'となっていること")
    test.assertSelectorHasText('.header .header-title', 'todos', 'ヘッダーが\'todos\'となっていること')
    test.assertSelectorHasText('.todo-form-footer .footer-left', '0 items left', 'アイテム数の表示が0となっていること')
    test.assertSelectorHasText('.todo-form-filters .is-selected', 'All', 'Allフィルタが選択されていること')
    test.assertSelectorHasText('.footer', 'Double-click to edit a todo - Escape to cancel', 'キーボード操作のメッセージが表示されていること')
    test.assertNotVisible('.todo-form-down-arrow', '矢印マークが表示されていないこと')
  )

  casper.run(() ->
    test.done()
  );
)