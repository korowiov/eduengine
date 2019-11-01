module Repositories
  class Engine < ::Rails::Engine
    isolate_namespace Repositories
    config.generators.api_only = true
  end
end
