require Repositories::Engine.root.join('app', 'models', 'repositories', 'application_record')

module Admin
  class ApplicationRecord < ::Repositories::ApplicationRecord
    self.abstract_class = true
  end
end
