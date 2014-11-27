$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "set_locale/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "set_locale"
  s.version     = SetLocale::VERSION
  s.authors     = ["Attila Györffy"]
  s.email       = ["attila@attilagyorffy.com"]
  s.homepage    = "http://github.com/liquid/set_locale"
  s.summary     = "Allows setting I18n.locale in Rails applications based on a variety of strategies."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.1"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "rspec"
  s.add_development_dependency "pry"
end
