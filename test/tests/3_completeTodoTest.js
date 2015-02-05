// Generated by CoffeeScript 1.9.0
(function() {
  casper.test.begin("TODOの完了表示テスト", 8, function(test) {
    casper.start(casper.global.targetUrl, function() {});
    casper.then(function() {
      return this.addTodo('Go to buy a iMac');
    });
    casper.then(function() {
      test.info("タスクを完了済みとしたら");
      this.mouse.click('.todo-list-item .todo-form-check');
      return this.waitForSelector('.todo-list-item .todo-form-check.is-completed', function() {
        test.assertExists('.todo-list-item .todo-form-check.is-completed', 'チェックマークが完了済みの表示になっていること');
        test.assertExists('.todo-list-item .todo-list-task.is-completed', 'タスクが完了済みの表示になっていること');
        test.assertSelectorHasText('.todo-form-footer .footer-left', '0 items left', 'アイテム数の表示が0となっていること');
        test.assertVisible('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small', '\'Clear completed\'ボタンが表示されていること');
        return test.assertSelectorHasText('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small', 'Clear completed (1)', 'Clear completedボタンに(1)表示が付いていること');
      });
    });
    casper.then(function() {
      test.info("矢印マークをクリックしたら");
      this.mouse.click('.todo-form-down-arrow');
      return this.waitForSelector('.todo-list-item .todo-form-check', function() {
        test.assertExists('.todo-list-item .todo-form-check', 'チェックマークが表示されていること');
        test.assertElementCount('.todo-list-item', 1, 'ひとつのTODOタスクが表示されていること');
        return test.assertSelectorHasText('.todo-list-item .todo-list-task', 'Go to buy a iMac', 'TODOタスクの中身が表示されていること');
      });
    });
    return casper.run(function() {
      return test.done();
    });
  });

}).call(this);

//# sourceMappingURL=3_completeTodoTest.js.map
