require 'bundler/setup'

task :default => [:build]

desc "Compile coffeescript files to javascript"
task :build do
  unless system("which coffee > /dev/null 2>&1")
    abort "CoffeeScript compiler is not installed. Download from http://coffeescript.org/"
  end

  sh "coffee -c -j 'all.js' -o public/javascripts/ src/"
  puts "SOURCE FILES COMPILED"

  sh "coffee -c -j 'all_specs.js' -o public/javascripts specs/"
  puts "SPEC FILES COMPILED\n"
end

desc "Run javascript tests"
task :test => [:build] do
  Rake::Task['ci'].invoke
end

desc "Run javascript tests on CI"
task :ci do
  unless system("which phantomjs > /dev/null 2>&1")
    abort "PhantomJS is not installed. Download from http://phantomjs.org"
  end

  cmd = "phantomjs runner.coffee file://localhost/#{File.dirname(__FILE__)}/public/SpecRunner.html "
  success = system(cmd)

  exit(1) unless success
end

desc "Automatically run tests (Mac OS X only)"
task :watch do
  # https://github.com/alloy/kicker
  system("kicker -e 'rake test'")
end