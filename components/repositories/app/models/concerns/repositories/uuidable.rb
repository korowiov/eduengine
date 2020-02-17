require 'securerandom'

module Repositories
  module Uuidable
    extend ActiveSupport::Concern

    included do
      before_create :generate_uuid
    end

    def generate_uuid
      loop do
        random_uuid = SecureRandom.uuid
        unless self.class.exists?(uuid: random_uuid)
          self.uuid = random_uuid and break
        end
      end
    end
  end
end