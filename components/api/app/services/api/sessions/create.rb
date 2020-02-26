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
        form.validate(auth_token_params) && form.save
      end

      private

      attr_reader :params

      def form
        @form ||=
          Repositories::AuthenticationTokens::CreateForm
          .new(Repositories::AuthenticationToken.new)
      end

      def auth_token_params
        {
          sign_in_ip: params[:ip],
          account_uuid: params[:account_uuid]
        }
      end
    end
  end
end