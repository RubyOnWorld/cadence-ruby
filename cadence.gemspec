require_relative './lib/cadence/version'

Gem::Specification.new do |spec|
  spec.name          = 'cadence'
  spec.version       = Cadence::VERSION
  spec.authors       = ['Anthony Dmitriyev']
  spec.email         = ['anthony.dmitriyev@coinbase.com']

  spec.summary       = 'Cadence Ruby client'
  spec.description   = 'A Ruby client for implementing Cadence workflows and activities in Ruby'
  spec.homepage      = 'https://github.com/coinbase/cadence-ruby'
  spec.license       = 'Apache License, Version 2.0'

  spec.require_paths = ['lib']
  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(/^(assets)/) ||
    f.match(/^(examples)/) ||
    f.match(/^(proxy)/) ||
    f.match(/^(spec)/) ||
    f.match(/^(thrift)/)
  end

  spec.add_dependency 'thrift'
  spec.add_dependency 'oj'
  spec.add_dependency 'dry-types', '~> 1.2.0'
  spec.add_dependency 'dry-struct', '~> 1.1.1'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'fabrication'
end
