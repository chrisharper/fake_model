# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "fake_model/version"

Gem::Specification.new do |s|
  s.name        = "fake_model"
  s.version     = FakeModel::VERSION
  s.authors     = ["Chris Harper"]
  s.email       = ["charper@branched.co.uk"]
  s.homepage    = "https://github.com/branched/fake_model"
  s.summary     = %q{Creates fake ActiveRecord model with validations}
  s.description = %q{Allows you to create classes that have ActiveRecord validations and can be used in forms}

  s.rubyforge_project = "fake_model"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # s.add_development_dependency "rspec"
   s.add_runtime_dependency "activesupport" ,'~> 3.0'
   s.add_runtime_dependency "activerecord" ,'~> 3.0'
end
