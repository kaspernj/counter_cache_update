$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "counter_cache_update/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "counter_cache_update"
  s.version     = CounterCacheUpdate::VERSION
  s.authors     = ["kaspernj"]
  s.email       = ["kaspernj@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of CounterCacheUpdate."
  s.description = "TODO: Description of CounterCacheUpdate."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.5"

  s.add_development_dependency "sqlite3"
end
