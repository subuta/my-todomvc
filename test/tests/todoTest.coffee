casper.test.begin("Google's page testing!", 5, (test) ->

  casper.sayHi();

  casper.start("http://www.google.com/", () ->
    test.assertTitle("Google", "google homepage title is the one expected");
    test.assertExists('form[action="/search"]', "main form is found");
    @fill('form[action="/search"]', {
      q: "casperjs"
    }, true)
  )

  casper.then(() ->
    test.assertTitle("casperjs - Google 検索", "google title is ok");
    test.assertUrlMatch(/q=casperjs/, "search term has been submitted");
    test.assertEval(() ->
      return __utils__.findAll("h3.r").length >= 10
    , "google search for \"casperjs\" retrieves 10 or more results"
    );
  );

  casper.run(() ->
    test.done()
  );
)