# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'toy_robo_simulator/version'

Gem::Specification.new do |spec|
  spec.name          = 'toy_robo_simulator'
  spec.version       = ToyRoboSimulator::VERSION
  spec.authors       = ['Adler']
  spec.email         = ['nkj20932@hotmail.com']

  spec.summary       = 'A toy robot simulator'
  spec.description   = 'A CLI that simulates the movement of a robot on a 5x5 table'
  spec.homepage      = 'http://github.com/adlerhsieh/toy_robo_simulator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '3.4.0'
  spec.add_development_dependency 'colorize', '0.7.7'
end
