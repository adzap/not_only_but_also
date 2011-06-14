# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "not_only_but_also/version"

Gem::Specification.new do |s|
  s.name        = "not_only_but_also"
  s.version     = NotOnlyButAlso::VERSION
  s.authors     = ["Adam Meehan"]
  s.description = %q{Rails plugin to split large models into separate files of concern. Like concerned_with but more convenient.}
  s.summary     = s.description
  s.email       = %q{adam.meehan@gmail.com}
  s.homepage    = %q{http://github.com/adzap/not_only_but_also}

  s.require_paths    = ["lib"]
  s.files            = `git ls-files`.split("\n") - %w{ .gitignore .rspec Gemfile Gemfile.lock autotest/discover.rb }
  s.test_files       = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.extra_rdoc_files = ["README.rdoc"]
end
