# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activesupport-refinements/version'

Gem::Specification.new do |gem|
  gem.name          = "activesupport-refinements"
  gem.version       = Activesupport::Refinements::VERSION
  gem.authors       = ["Akira Matsuda"]
  gem.email         = ["ronnie@dio.jp"]
  gem.description   = 'Side-effect-free ActiveSupport using Refinements'
  gem.summary       = 'ActiveSupport + Ruby 2.0 refinements'
  gem.homepage      = 'https://github.com/amatsuda/activesupport-refinements'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'
end
