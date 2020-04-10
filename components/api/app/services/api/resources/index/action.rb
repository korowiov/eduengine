module Api
  module Resources
    module Index
      class Action
        include Api::Patterns::Services

        delegate :valid?, to: :params, prefix: true

        def initialize(params = {})
          @params = Params.new(params)
          raise_error! unless params_valid?
        end

        def call
          Repositories::Resources::FetchQuery
          .new
          .call(params)
        end

        private

        attr_reader :params

        def raise_error!
          raise ExceptionHandler::InvalidResourceParams, 'Invalid params'
        end
      end
    end
  end
end