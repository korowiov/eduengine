require 'rails_admin'
require 'pry-rails'

module Admin
  class Engine < ::Rails::Engine
    isolate_namespace Admin

    initializer :append_migrations do |app|
      unless app.root.to_s.match root.to_s+File::SEPARATOR
        app.config.paths['db/migrate'].concat config.paths['db/migrate'].expanded
      end
    end     
  end
end
