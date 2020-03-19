$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'repositories/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'repositories'
  spec.version     = Repositories::VERSION
  spec.authors     = ['Korowiov']
  spec.email       = ['g.f.speranza@gmail.com']
  spec.summary     = 'Summary of Repositories.'
  spec.description = 'Description of Repositories.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'acts-as-taggable-on', '~> 6.0'
  spec.add_dependency 'ancestry'
  spec.add_dependency 'bcrypt'
  spec.add_dependency 'carrierwave', '~> 2.0'
  spec.add_dependency 'friendly_id', '~> 5.2.4'
  spec.add_dependency 'rails', '~> 6.0.0'
  spec.add_dependency 'reform'
  spec.add_dependency 'reform-rails'

  spec.add_development_dependency 'pg'
end
