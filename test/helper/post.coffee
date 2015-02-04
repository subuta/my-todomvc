casper.echo("-- E2Eテスト(CasperJS)[終了] --");

# テストで利用するグローバル変数を破棄
casper.global = {}

casper.test.done();