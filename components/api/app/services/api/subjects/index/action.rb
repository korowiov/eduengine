module Api
  module Subjects
    module Index
      class Action
        include Api::Patterns::Services

        def initialize(params = {})
          @params = params
        end

        def call
          query_class.roots
        end

        private

        attr_reader :params

        def query_class
          Repositories::Subjects::FetchQuery
        end
      end
    end
  end
end