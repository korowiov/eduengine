module Repositories
  class Subject < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_ancestry cache_depth: true

    has_many :resources, class_name: 'Repositories::Resource',
                         foreign_key: 'subject_id',
                         primary_key: 'id'

    belongs_to :parent, class_name: 'Repositories::Subject',
                        foreign_key: 'ancestry',
                        primary_key: 'id',
                        optional: true
  end
end
