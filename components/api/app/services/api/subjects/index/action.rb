module Api
  module Subjects
    module Index
      class Action
        include Api::Patterns::Services

        def initialize(params = {})
          @params = params
        end

        def call       
          Repositories::Subjects::FetchQuery
            .new
            .roots
        end

        private

        attr_reader :params
      end
    end
  end
end