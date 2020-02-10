module Repositories
  module AuthenticationTokens
    class Create
      include Repositories::Callable

      def call
        return resource_errors(resource) unless resource.save

        serialize(resource)
      end

      private

      def generate_token
        generated_token = Digest::SHA1.hexdigest("#{Time.now}-#{params[:account_uuid]}")

        if Repositories::Accounts::Fetch.call(authentication_token: generated_token)
          return generate_token
        end 

        generated_token
      end

      def resource
        @resource ||=
          Repositories::AuthenticationToken.new(
            authentication_token: generate_token,
            account_uuid: params[:account_uuid],
            sign_in_ip: params[:sign_in_ip]
          )
      end
    end
  end
end