module Api
  module Authentication
    module HelperMethods
      def authenticate!
        request.env['warden'].authenticate!
      end

      def current_account
        request.env['warden'].user
      end
    end
  end 
end