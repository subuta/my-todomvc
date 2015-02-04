casper.test.begin("TodoMVCApp page testing!", 3, (test) ->

  # ページの表示内容のチェック
  casper.start(casper.global.targetUrl, () ->
    # タイトルのチェック
    test.assertTitle("TodoMVC", "todoMVC App's title is TodoMVC");
    # headerのタイトルのチェック
    test.assertSelectorHasText('.header .header-title', 'todos', 'header text is \'todos\'');
    # ページ表示時のアイテム数のチェック
    test.assertSelectorHasText('.todo-form-footer .footer-left', '0 items left', 'item count is 0 when page shown');
  )

#  casper.then(() ->
#    test.assertTitle("casperjs - Google 検索", "google title is ok");
#    test.assertUrlMatch(/q=casperjs/, "search term has been submitted");
#    test.assertEval(() ->
#      return __utils__.findAll("h3.r").length >= 10
#    , "google search for \"casperjs\" retrieves 10 or more results"
#    );
#  );

  casper.run(() ->
    test.done()
  );
)