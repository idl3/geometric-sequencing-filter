$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "geometric_sequence/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "geometric-sequence-filter"
  s.version     = GeometricSequence::VERSION
  s.authors     = ["Ernest Sim"]
  s.email       = ["ernest@anzu.sg"]
  s.homepage    = "http://www.anzu.sg"
  s.summary     = "Geometric Sequence Filter is a Gem to allow multiple filtering with just a single numeric value"
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", ">= 3.2", "< 6.1"
end
