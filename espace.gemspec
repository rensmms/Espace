$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "espace/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name = "espace"
  s.version = Espace::VERSION
  s.authors = ["olivier"]
  s.email = ["olivier@example.com"]
  s.homepage = ""
  s.summary = ""
  s.description = "Création de pages et édition de blog"
  s.license = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.3"
  s.add_development_dependency "mysql2", '~> 0'
end
