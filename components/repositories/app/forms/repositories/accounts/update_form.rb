module Repositories
  module Accounts
    class UpdateForm < Repositories::BaseForm
      properties :email, :nickname

      validates :email, presence: true,
                        format: URI::MailTo::EMAIL_REGEXP
      validates_uniqueness_of :email
      validates :nickname, presence: true
    end
  end
end