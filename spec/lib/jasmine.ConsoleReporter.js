(function(jasmine, console) {

  if (!jasmine) { throw "jasmine library isn't loaded!"; }
  if (!console || !console.log) { throw "console isn't present!"; }

  var colorMap = {
    "red" : 31,
    "green" : 32,
    "yellow" : 33,
    "purple" : 34,
    "pink" : 35,
    "turquoise" : 36
  };

  jasmine.ConsoleReporter= function() {
    window.jasmineErrorCount = undefined;
  };

  jasmine.ConsoleReporter.prototype = {

    reportRunnerStarting: function(runner) {
      this.startTime = new Date().getTime();
      this.executedSpecs = 0;
      this.passedSpecs = 0;
    },

    reportSpecStarting: function(spec) {
      this.executedSpecs++;
    },

    reportSpecResults: function(spec) {
      var results = spec.results();
      if (results.passed()) {
        this.passedSpecs++;
        return;
      }

      this.log("\n" + spec.getFullName(), "red");

      var resultItems = results.getItems();
      for (var i = 0; i < resultItems.length; i++) {
        var result = resultItems[i];
        if (result.type == 'log') {
          this.log(result, "yellow");
        } else if (result.type == 'expect' && result.passed && !result.passed()) {
          this.log(result.message, "red");
          if (result.trace.stack) {
            this.log(result.trace.stack, "yellow");
          }
        }
      }
    },

    reportRunnerResults: function(runner) {
      var failureCount = this.executedSpecs - this.passedSpecs;
      var specDetails = this.executedSpecs + (this.executedSpecs === 1 ? " spec, " : " specs, ");
      var failureDetails = failureCount + (failureCount === 1 ? " failure\n" : " failures\n");
      var color = failureCount > 0 ? "red" : "green";
      var duration = new Date().getTime() - this.startTime;

      this.log("\nFinished in " + (duration/1000) + " seconds\n");
      this.log(specDetails + failureDetails, color);

      window.jasmineErrorCount = failureCount;
    },

    colorizeText: function(text, color) {
      var colorCode = colorMap[color];
      return "\033[" + colorCode + "m" + text + "\033[0m";
    },

    log: function(output, color) {
      var text = (color != undefined) ? this.colorizeText(output, color) : output;
      console.log(text);
    }

  };

})(jasmine, console);
