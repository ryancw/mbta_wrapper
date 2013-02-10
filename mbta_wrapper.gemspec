# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mbta_wrapper/version'

Gem::Specification.new do |gem|
  gem.name          = "mbta_wrapper"
  gem.version       = MbtaWrapper::VERSION
  gem.authors       = ["Ryan Williams"]
  gem.email         = ["ryancwilliams9@gmail.com"]
  gem.description   = "Simple MBTA Ruby wrapper"
  gem.summary       = "Simple MBTA Ruby wrapper"
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
