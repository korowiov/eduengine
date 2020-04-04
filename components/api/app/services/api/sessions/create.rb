module Api
  module Sessions
    class Create
      include Api::Patterns::Services

      delegate :errors, :model, to: :form
      alias resource model

      def initialize(params = {})
        @params = params
      end

      def call
        session_created?.tap do |result|
          if result
            model.account.expire_oldest_tokens!
            model.hashed_authentication_token = form.hashed_authentication_token
          end
        end
      end

      private

      attr_reader :params

      def auth_token_params
        {
          sign_in_ip: params[:ip],
          account_uuid: params[:account_uuid]
        }
      end

      def form
        @form ||=
          Repositories::AuthenticationTokens::CreateForm
          .new(Repositories::AuthenticationToken.new)
      end

      def session_created?
        form.validate(auth_token_params) && form.save
      end
    end
  end
end