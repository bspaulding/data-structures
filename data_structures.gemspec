# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "data_structures/version"

Gem::Specification.new do |s|
  s.name        = "data_structures"
  s.version     = DataStructures::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Bradley J. Spaulding"]
  s.email       = ["brad.spaulding@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Contains ActiveRecord compatible implementations of common data structures.}
  s.description = %q{Contains ActiveRecord compatible implementations of common data structures.}

  s.rubyforge_project = "data_structures"

  [
    ["activerecord", ">= 2.3.11"]
  ].each {|dependency| s.add_dependency(*dependency) }
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
