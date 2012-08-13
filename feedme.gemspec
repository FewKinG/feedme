# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "feedme/version"

Gem::Specification.new do |s|
  s.name        = "feedme"
  s.version     = Feedme::VERSION
  s.authors     = ["Sven C."]
  s.email       = ["fewking@paniccrew.de"]
  s.homepage    = ""
  s.summary     = %q{Simple feedback gem for Rails 3 }
  s.description = %q{Feedback plugin to query the user for ratings, opinions, Q&A etc. Goal is to make it work nicely with Ajax-heavy and non-ActiveRecord implementations}

  s.rubyforge_project = "feedme"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  s.add_runtime_dependency "i18n-js"
 
end
