module Api
  module Accounts
    class Create
      include Api::Patterns::Services

      delegate :errors, :model, to: :form
      alias resource model

      def initialize(params = {})
        @params = params
      end

      def call
        form.validate(params) && form.save
      end

      private

      attr_reader :params

      def form
        @form ||=
          Repositories::Accounts::CreateForm.new(Repositories::Account.new)
      end
    end
  end
end