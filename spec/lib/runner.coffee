# Script Begin
if phantom.args.length == 0
  console.log "Need a url as the argument"
  phantom.exit 1

reportWatcher =
  run: (page, max_tries=10) ->
    tries = 0

    callback = =>
      tries = @incrementTries(tries, max_tries)
      @checkForReportCompletion(page)

    setTimeout callback, 100

  incrementTries: (tries, max_tries) ->
    phantom.exit 1 if tries == max_tries
    tries + 1

  getErrorCount: (page) ->
    page.evaluate ->
      window.jasmineErrorCount

  checkForReportCompletion: (page) ->
    errorCount = @getErrorCount(page)
    if errorCount == undefined then return
    if errorCount == 0 then phantom.exit 0 else phantom.exit 1

address = phantom.args[0]
page = new WebPage()

page.onConsoleMessage = (msg) ->
  console.log msg

page.onError = (msg, trace) ->
  console.log msg
  trace.forEach (item) ->
    console.log " #{item.file}:#{item.line}"

# page.onInitialized = =>
#   page.evaluate =>
#     window.onload = =>
#       jasmine.getEnv().addReporter(new jasmine.ConsoleReporter())

# open test page and wait for completion
page.open address, (status) ->
  if status != 'success'
    console.log 'Unable to access network'
    phantom.exit 1

  reportWatcher.run(page);
