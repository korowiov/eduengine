require Repositories::Engine.root.join('app', 'models', 'repositories', 'account')

module Repositories
  class Account
    include Repositories::Validations::AccountValidation

    before_save do
      if new_record?
        self.uid ||= self.email
        self.provider ||= 'email'
      end
    end

    rails_admin do
      create do
        fields :nickname
        field :email
        field :password
        field :password_confirmation
      end

      edit do
        field :nickname
        field :email
        field :password
        field :password_confirmation
      end

      list do
        field :id
        field :nickname
        field :email
      end
    end
  end
end