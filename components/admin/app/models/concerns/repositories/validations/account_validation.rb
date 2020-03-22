module Repositories
  module Validations
    module AccountValidation
      extend ActiveSupport::Concern

      included do
        validates :email, presence: true, uniqueness: true
        validates :nickname, presence: true, uniqueness: true
        validates_presence_of :password_digest
        validates_presence_of :password_confirmation, :if => :password_digest_changed?
        validates :password, format: {with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{8,}\z/}, if: :password
      end
    end
  end
end