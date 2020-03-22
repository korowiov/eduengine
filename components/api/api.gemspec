$:.push File.expand_path('lib', __dir__)

# Maintain your gem's version:
require 'api/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = 'api'
  spec.version     = Api::VERSION
  spec.authors     = ['Korowiov']
  spec.email       = ['g.f.speranza@gmail.com']
  spec.summary     = 'Summary of Api.'
  spec.description = 'Description of Api.'
  spec.license     = 'MIT'

  spec.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  spec.add_dependency 'active_model_serializers'
  spec.add_dependency 'rails', '~> 6.0.0'
  spec.add_dependency 'repositories'
  spec.add_dependency 'warden'

  spec.add_development_dependency 'pg'
end
