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
          resources = query_class.published

          if params.types?
            resources = query_class.by_types(params.types, resources)
          end

          if params.subjects?
            resources = query_class.by_subjects(params.subjects, resources)
          end

          if params.sort?
            case params.sort
            when 'date_asc'
              resources = query_class.by_oldest(resources)
            when 'date_desc'
              resources = query_class.by_newest(resources)
            end
          end

          resources
        end

        private

        attr_reader :params

        def raise_error!
          raise ExceptionHandler::InvalidResourceParams, 'Invalid params'
        end

        def query_class
          Repositories::Resources::FetchQuery
        end
      end
    end
  end
end