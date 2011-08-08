# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "dispatch_queue"

Gem::Specification.new do |s|
  s.name        = "dispatch_queue"
  s.version     = DispatchQueue::VERSION
  s.authors     = ["Guillermo Álvarez"]
  s.email       = ["guillermo@cientifico.net"]
  s.homepage    = ""
  s.summary     = %q{Simple way to work enqueue works}
  s.description = %q{Little gem to enqueue jobs the easy way}

  s.rubyforge_project = "dispatch_queue"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_paths = ["lib"]
end
