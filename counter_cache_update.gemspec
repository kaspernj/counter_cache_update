$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "counter_cache_update/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "counter_cache_update"
  s.version     = CounterCacheUpdate::VERSION
  s.authors     = ["kaspernj"]
  s.email       = ["kaspernj@gmail.com"]
  s.homepage    = "https://github.com/kaspernj/counter_cache_update"
  s.summary     = "Scans all your models and updates all counter caches with optimised SQL."
  s.description = "Scans all your models and updates all counter caches with optimised SQL."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 5.1.5"
  s.add_runtime_dependency "service_pattern", ">= 0.0.3"

  s.add_development_dependency "best_practice_project", "0.0.10"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "rubocop", "0.53.0"
  s.add_development_dependency "sqlite3"
end
