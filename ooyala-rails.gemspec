# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ooyala/rails/version'

Gem::Specification.new do |spec|
  spec.name          = 'ooyala-rails'
  spec.version       = Ooyala::Rails::VERSION
  spec.authors       = ["Zubin Henner"]
  spec.email         = ['zubin@rubidium.com.au']

  spec.summary       = "Integrates Ooyala with Rails"
  spec.homepage      = 'https://github.com/zubin/ooyala-rails'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 4'
  spec.add_dependency 'ooyala-v2-api'
  spec.add_dependency 'rails-assets-jquery-ooyala'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
