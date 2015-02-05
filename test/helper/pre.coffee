casper.echo("-- E2Eテスト(CasperJS)[開始] --");

# テストで利用するグローバル変数を定義
casper.global = {}
casper.global.targetUrl = 'http://localhost:3000/'
casper.global.evidenceFolder = './test/evidence'

casper.test.done();