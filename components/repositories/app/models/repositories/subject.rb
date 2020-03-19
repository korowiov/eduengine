module Repositories
  class Subject < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    has_ancestry

    has_many :resources, class_name: 'Repositories::Resource',
                         foreign_key: 'subject_id',
                         primary_key: 'id'
  end
end
