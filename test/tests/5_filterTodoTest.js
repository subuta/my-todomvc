// Generated by CoffeeScript 1.9.0
(function() {
  casper.test.begin("TODOのフィルタ表示テスト", 11, function(test) {
    casper.start(casper.global.targetUrl, function() {});
    casper.then(function() {
      this.addTodo('Go to buy a iMac');
      this.addTodo('Go to buy a MacBook Pro');
      this.addTodo('Go to buy a Mac Mini');
      test.assertElementCount('.todo-list-item', 3, '３つのTODOタスクが表示されていること');
      test.assertSelectorHasText('.todo-form-footer .footer-left', '3 items left', 'アイテム数の表示が３となっていること');
      test.assertSelectorHasText('#todo-form-filter-all.is-selected', 'All', 'Allフィルタが選択されていること');
      test.info("最初のタスクを完了済みとしたら");
      return this.mouse.click('.todo-list-item:first-child .todo-form-check');
    });
    casper.then(function() {
      test.assertElementCount('.todo-list-item', 3, '３つのTODOタスクが表示されていること');
      test.assertSelectorHasText('.todo-form-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること');
      test.info("フィルタをActiveとしたら");
      this.mouse.click('#todo-form-filter-active');
      return this.waitForSelector('#todo-form-filter-active.is-selected', function() {
        test.assertElementCount('.todo-list-item', 2, '２つのTODOタスクが表示されていること');
        test.assertSelectorHasText('.todo-form-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること');
        return test.assertSelectorHasText('.todo-list-item:first-child .todo-list-task', 'Go to buy a MacBook Pro', '表示されているタスクが想定どおりのタスクで有ること');
      });
    });
    casper.then(function() {
      test.info("フィルタをCompletedとしたら");
      this.mouse.click('#todo-form-filter-completed');
      return this.waitForSelector('#todo-form-filter-completed.is-selected', function() {
        test.assertElementCount('.todo-list-item', 1, '１つのTODOタスクが表示されていること');
        test.assertSelectorHasText('.todo-form-footer .footer-left', '2 items left', 'アイテム数の表示が２となっていること');
        return test.assertSelectorHasText('.todo-list-item:first-child .todo-list-task', 'Go to buy a iMac', '表示されているタスクが想定どおりのタスクで有ること');
      });
    });
    return casper.run(function() {
      return test.done();
    });
  });

}).call(this);

//# sourceMappingURL=5_filterTodoTest.js.map
