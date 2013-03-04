lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gem_newgem/platform'

Gem::Specification.new do |spec|

  spec.platform      = Gem::Platform::RUBY
  spec.name          = "gem-newgem"
  spec.version       = GemNewgem::VERSION
  spec.summary       = GemNewgem::SUMMARY
  spec.description   = spec.summary

  spec.required_ruby_version     = '>= 1.9.2'
  spec.required_rubygems_version = '>= 1.8'

  spec.authors       = ["Leo Gallucci"]
  spec.email         = ["elgalu3@gmail.com"]
  spec.homepage      = "https://github.com/elgalu/gem-newgem"

  spec.license       = 'MIT'

  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  spec.files         = `git ls-files`.split($/)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "thor-exclude_pattern", ">= 0.18.1"
  spec.add_runtime_dependency "activesupport", ">= 3"

  spec.add_development_dependency "bundler", ">= 1.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.13"
  spec.add_development_dependency "redcarpet", ">= 2.2"
  spec.add_development_dependency "yard", ">= 0.8"
  spec.add_development_dependency "simplecov", ">= 0.7"
  spec.add_development_dependency 'coveralls', '>= 0.5.7'

end
