module Repositories
  module Reloadable
    extend ActiveSupport::Concern
  
    included do
      after_commit :reload_uuid, on: :create
    end
  
    def reload_uuid
      if attributes.key? 'uuid'
        self[:uuid] = self.class.find_by(id: id)&.uuid
      end
    end
  end
end