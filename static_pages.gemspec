$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "static_pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "static_pages"
  s.version     = StaticPages::VERSION
  s.authors     = ["yukihiro hara"]
  s.email       = ["yukihr@gmail.com"]
  s.homepage    = "http://github.com/yukihr/static_pages"
  s.summary     = "Static page supports for Rails"
  s.description = "This pluign provides supports for static pages to rails."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]
  s.require_paths = ['lib']

  s.required_ruby_version = '>= 1.9.3'

  s.add_dependency "rails", "~> 4"
  s.add_dependency "sprockets-rails", "~> 2"

  s.add_development_dependency "sqlite3"
end
