$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rails_db_info/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rails_db_info"
  s.version     = RailsDbInfo::VERSION
  s.authors     = ["Vlado Cingel"]
  s.email       = ["vladocingel@gmail.com"]
  s.homepage    = "https://github.com/vlado/rails_db_info"
  s.summary     = "RailsDbInfo is a Rails engine that quickly shows the database info"
  s.description = "RailsDbInfo is a Rails engine that quickly shows the database info"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.0"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "pg"
  s.add_development_dependency "sqlite3"
end
