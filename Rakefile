require 'bundler/setup'
require 'colored'
require 'coffee-script'

task :default => [:build]

desc "Compile coffeescript files to javascript"
task :build do
  sh "coffee -c -j 'all.js' -o build/ src/"
  sh "coffee -c -j 'all_specs.js' -o build/ spec/"
end

desc "Run javascript tests"
task :test => [:build] do
  unless system("which phantomjs > /dev/null 2>&1")
    abort "PhantomJS is not installed. Download from http://phantomjs.org"
  end

  cmd = "phantomjs spec/lib/runner.coffee file://localhost/#{File.dirname(__FILE__)}/SpecRunner.html "
  success = system(cmd)

  if success
    #puts "PASS"
  else
    #puts "FAIL"
    exit(1)
  end
end

desc "Automatically run tests (Mac OS X only)"
task :autotest do
  # https://github.com/alloy/kicker
  system("kicker -e 'rake test'")
end