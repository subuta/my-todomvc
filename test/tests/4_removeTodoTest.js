// Generated by CoffeeScript 1.9.0
(function() {
  casper.test.begin("TODOの削除テスト", 8, function(test) {
    casper.start(casper.global.targetUrl, function() {});
    casper.then(function() {
      this.addTodo('Go to buy a iMac');
      return this.waitForSelector('.todo-list-item .todo-list-task', function() {
        test.assertVisible('.todo-form-down-arrow', '矢印マークが表示されていること');
        test.assertExists('.todo-list-item .todo-form-check', 'チェックマークが表示されていること');
        test.assertElementCount('.todo-list-item', 1, 'ひとつのTODOタスクが表示されていること');
        test.assertSelectorHasText('.todo-list-item .todo-list-task', 'Go to buy a iMac', 'TODOタスクの中身が表示されていること');
        test.assertNotVisible('.todo-list-item .todo-form-remove', '削除マークが表示されていないこと');
        return test.assertSelectorHasText('.todo-form-footer .footer-left', '1 items left', 'アイテム数の表示が1となっていること');
      });
    });
    casper.then(function() {
      test.info("タスクを完了済みとしたら");
      this.mouse.click('.todo-list-item .todo-form-check');
      test.info("タスクを削除したら");
      this.waitForSelector('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small', function() {
        return this.evaluate(function() {
          return document.querySelector('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small').click();
        });
      });
      return this.waitWhileVisible('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small', function() {
        test.assertNotVisible('.todo-form-footer-wrapper .todo-form-footer .footer-right .btn-small', '\'Clear completed\'ボタンが非表示となっていること');
        return test.assertSelectorHasText('.todo-form-footer .footer-left', '0 items left', 'アイテム数の表示が0となっていること');
      });
    });
    return casper.run(function() {
      return test.done();
    });
  });

}).call(this);

//# sourceMappingURL=4_removeTodoTest.js.map
