# 独自の関数の定義
casper.addTodo = (todo) ->
  @fillSelectors('.todo-form',{ 'input.todo-input': todo })
  @sendKeys('input.todo-input',@page.event.key.Enter , {keepFocus: true})

casper.captureEvidence = (fileName) ->
  @capture("#{@global.evidenceFolder}/#{fileName}.png")