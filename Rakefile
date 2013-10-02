require "bundler"
require 'rake'
require 'rspec/core/rake_task'

Bundler.setup
gemspec = eval(File.read("play_market.gemspec"))

task :build => "#{gemspec.full_name}.gem"
file "#{gemspec.full_name}.gem" => gemspec.files + ["play_market.gemspec"] do
  system "gem build play_market.gemspec"
end

RSpec::Core::RakeTask.new(:spec)
task :default  => :spec