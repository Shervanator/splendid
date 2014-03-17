# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'splendid/version'

Gem::Specification.new do |spec|
  spec.name          = "splendid"
  spec.version       = Splendid::VERSION
  spec.authors       = ["Shervin Aflatooni"]
  spec.email         = ["shervinaflatooni@gmail.com"]
  spec.summary       = "Check if your site looks as expected"
  spec.description   = "Want to test if a webpage looks as expected? Use splendid in your tests to make sure styles are not broken on your site!"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"

  spec.add_dependency "imgkit"
  spec.add_dependency "chunky_png"
end
