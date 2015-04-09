# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'betfair_ng/version'

Gem::Specification.new do |spec|
  spec.name          = "betfair-ng"
  spec.version       = BetfairNg::VERSION
  spec.authors       = ["Val Milkevich"]
  spec.email         = ["milkevich@gmail.com"]
  spec.summary       = %q{Betfair NG API integration}
  spec.description   = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "multi_json"
  spec.add_runtime_dependency "json"
  spec.add_runtime_dependency "activesupport"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "growl"
  spec.add_development_dependency "webmock"
end
