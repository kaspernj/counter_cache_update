source "https://rubygems.org"

# Declare your gem's dependencies in counter_cache_update.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

group :development, :test do
  gem "best_practice_project", require: false, git: "https://github.com/kaspernj/best_practice_project.git"
  gem "factory_bot_rails", "4.8.2", require: false
  gem "rspec-rails", "3.9.0"
  gem "rubocop", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "sqlite3", "1.3.13"
end

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]
