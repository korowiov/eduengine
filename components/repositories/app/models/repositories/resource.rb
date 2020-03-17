module Repositories
  class Resource < ApplicationRecord
    include Uuidable

    enum status: {
      draft: 'draft',
      pending: 'pending',
      published: 'published',
      revoked: 'revoked'
    }

    belongs_to :author, class_name: 'Repositories::Account',
                        foreign_key: 'author_uuid',
                        primary_key: 'uuid'

    scope :with_status, ->(status) do
      where(status: status)
    end

    def self.find_sti_class(type_name)
      type_name = self.name
      super
    end
  end
end
