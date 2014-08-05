# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)


Gem::Specification.new do |s|
  s.name = "symbolic"
  s.version = "0.0"
  s.authors = ["Rajat Kapoor"]
  s.description = "Symbolicl integration for JRuby using JScience"
  s.email = ["rajat100493@gmail.com"]
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features,benchmark}/*`.split("\n")  
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  s.summary = "A suite for symbolic integration in Ruby"
  s.add_development_dependency 'rake', '~>10'
  s.add_development_dependency 'bundler', '~>1.3'
  s.add_development_dependency 'rspec', '~>2.0'
end
