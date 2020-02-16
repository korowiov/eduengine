module Repositories
  module Accounts
    class CreateForm < Repositories::BaseForm
      properties :email, :nickname, :password, :password_confirmation

      validates :email, presence: true,
                        format: URI::MailTo::EMAIL_REGEXP
      validates_uniqueness_of :email
      validates :password, presence: true,
                           format: {with: /\A(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\W]).{8,}\z/}
      validates :nickname, presence: true
      validate :confirmation_of_password

      private

      def confirmation_of_password
        if password != password_confirmation
          errors.add(:password_confirmation, :invalid)
        end
      end
    end
  end
end