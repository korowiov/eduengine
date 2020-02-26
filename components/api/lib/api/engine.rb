require 'active_model_serializers'
require 'warden'

module Api
  class Engine < ::Rails::Engine
    isolate_namespace Api

    config.autoloader = :classic
    config.generators.api_only = true

    config.autoload_paths += %W[#{config.root}/lib]
    config.generators.api_only = true
    config.middleware.use Warden::Manager do |manager|
      manager.default_strategies %i[authentication_token credentials]
      manager.failure_app = Api::UnauthorizedController
    end

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s+File::SEPARATOR
        app.config.paths['db/migrate'].concat config.paths['db/migrate'].expanded
      end
    end
  end
end
