# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'odlgem/version'

Gem::Specification.new do |spec|
  spec.name          = "odlgem"
  spec.version       = Odlgem::VERSION
  spec.authors       = ["rickpr"]
  spec.email         = ["fdisk@fdisk.co"]
  spec.summary       = "Ruby Wrapper for OpenDaylight FlowProgrammer"
  spec.description   = "Makes Programming OpenDaylight flows with Ruby easy"
  spec.homepage      = "http://fdisk.co"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
