# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)

Gem::Specification.new do |s|
  s.name = "em-connectify"
  s.version = 0

  s.platform = Gem::Platform::RUBY
  s.authors = ["Ilya Grigorik"]
  s.email = ["ilya@igvita.com"]
  s.homepage = "http://github.com/igrigorik/em-http-request"
  s.summary = "EventMachine CONNECT support"
  s.description = s.summary
  s.rubyforge_project = "em-connectify"

  s.add_dependency "eventmachine", ">= 1.0.0.beta.4"
  s.add_dependency "addressable", ">= 2.2.3"
  s.add_dependency "http_parser.rb", ">= 0.5.3"
  s.add_dependency "em-socksify"
  s.add_dependency "cookiejar"

  s.add_development_dependency "rspec"
  s.add_development_dependency "rake"
  s.add_development_dependency "rack"
  s.add_development_dependency "yajl-ruby"
  s.add_development_dependency "mongrel", "~> 1.2.0.pre2"

  s.files = `git ls-files`.split("\n")
  s.test_files = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
