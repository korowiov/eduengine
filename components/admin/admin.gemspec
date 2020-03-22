$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'admin/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'admin'
  spec.version     = Admin::VERSION
  spec.authors     = ['Korowiov']
  spec.email       = ['g.f.speranza@gmail.com']
  spec.summary     = 'Summary of Admin.'
  spec.description = 'Description of Admin.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'rails', '~> 6.0.0'
  spec.add_dependency 'rails_admin'
  spec.add_dependency 'repositories'

  spec.add_development_dependency 'pg'
  spec.add_development_dependency 'pry-rails'
end
