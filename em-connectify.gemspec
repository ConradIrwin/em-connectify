Gem::Specification.new do |s|
  s.name        = "em-connectify"
  s.version     = "0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Conrad Irwin"]
  s.email       = ["conrad.irwin@gmail.com"]
  s.homepage    = "http://github.com/ConradIrwin/em-connectify"
  s.summary     = "EventMachine CONNECTify shim: adds CONNECT support to any protocol"
  s.description = s.summary + '.'
  s.license     = 'MIT'

  s.rubyforge_project = "em-connectify"

  s.add_dependency "eventmachine", ">= 1.0.0.beta.4"
  s.add_development_dependency "rspec"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
