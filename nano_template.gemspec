# coding: utf-8
lib = File.expand_path('../lib', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "nano_template"
  spec.version       = "0.1.0"
  spec.authors       = ["Narazaka"]
  spec.email         = ["info@narazaka.net"]

  spec.summary       = %q{text template like erb that can be used with opal}
  spec.description   = %q{text template like erb that can be used with opal}
  spec.homepage      = "https://github.com/Narazaka/nano_template"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", ">= 1.7.9"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.4"
  spec.add_development_dependency "yard", "~> 0.9.11"
  spec.add_development_dependency "simplecov", "~> 0.11"
  spec.add_development_dependency "codecov", "~>0.1"
end
