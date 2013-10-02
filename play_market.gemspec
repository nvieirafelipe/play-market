$:.push File.expand_path("../lib", __FILE__)
require "play_market/version"

Gem::Specification.new do |s|
  s.name        = 'play_market'
  s.authors     = ['Felipe Vieira']
  s.email       = 'nvieirafelipe@gmail.com'
  s.license       = 'MIT'
  s.homepage    = 'http://github.com/nvieirafelipe/play-market'
  s.version     = PlayMarket::VERSION
  s.platform    = Gem::Platform::RUBY
  s.summary     = 'Google Play Market'
  s.description = 'Google Play In-App Purchase Receipt Verification'

  s.files         = Dir["./**/*"].reject { |file| file =~ /\.\/(bin|log|pkg|script|spec|test|vendor)/ }
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
end