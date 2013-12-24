source "https://rubygems.org"

rails_version = if ENV['RAILS_VERSION']
  { :github => 'rails/rails', :branch => ENV['RAILS_VERSION'] }
else
  '>= 3.1.0'
end

gem 'rails', rails_version

# Declare your gem's dependencies in rails_db_info.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
