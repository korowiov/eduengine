module SharedContexts
  module StubSignedAccount
    extend ActiveSupport::Concern
    include SharedContexts::SetEncryptionKey

    included do
      let(:account_password) { 'AccountP4$$' } 
      let(:account) do
        create(
          :account, 
          password: account_password, 
          password_confirmation: account_password
        )
      end
      let(:tokens) do
        Repositories::AuthenticationTokens::Generator
          .prepare_tokens(account.uuid)
      end
      let(:session) do
        create(
          :authentication_token,
          account: account,
          authentication_token: tokens.first
        )
      end
      let(:authentication_headers) do
        {
          'Access-Token' => tokens.last,
          'Uuid' => account.uuid
        }
      end
    end

    def setup
      super()    
      account
      session
    end
  end
end