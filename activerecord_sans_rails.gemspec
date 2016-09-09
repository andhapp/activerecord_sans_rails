# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'activerecord_sans_rails/version'

Gem::Specification.new do |spec|
  spec.name          = "activerecord_sans_rails"
  spec.version       = ActiverecordSansRails::VERSION
  spec.authors       = ["Anuj Dutta"]
  spec.email         = ["anuj@andhapp.com"]

  spec.summary       = %q{Allow using activerecord outside of rails}
  spec.description   = %q{Allow using activerecord outside of rails}
  spec.homepage      = "https://github.com/andhapp/activerecord_sans_rails.git"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
end
