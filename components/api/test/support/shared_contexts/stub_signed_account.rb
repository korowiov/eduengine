module SharedContexts
  module StubSignedAccount
    extend ActiveSupport::Concern

    included do
      let(:account_password) { 'AccountP4$$' } 
      let(:account) do
        create(
          :account, 
          password: account_password, 
          password_confirmation: account_password
        )
      end
      let(:auth_hash) { account.generate_authentication_token! }
      let(:authentication_headers) do
        {'Access-Token' => auth_hash[:authentication_token]}
      end
    end
  end
end