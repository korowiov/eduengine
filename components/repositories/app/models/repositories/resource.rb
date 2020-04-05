module Repositories
  class Resource < ApplicationRecord
    include Uuidable
    acts_as_taggable

    enum status: {
      draft: 'draft',
      pending: 'pending',
      published: 'published',
      revoked: 'revoked'
    }

    enum education_level: {
      grade_4_6: 'grade_4_6',
      grade_7_8: 'grade_7_8',
      grade_9_12: 'grade_9_12'
    }

    has_one_attached :cover

    belongs_to :author, class_name: 'Repositories::Account',
                        foreign_key: 'author_uuid',
                        primary_key: 'uuid'

    belongs_to :subject, class_name: 'Repositories::Subject',
                         foreign_key: 'subject_id',
                         primary_key: 'id'

    scope :with_status, ->(status) do
      where(status: status)
    end

    def self.find_sti_class(type_name)
      type_name = self.name
      super
    end
  end
end
