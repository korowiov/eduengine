module Repositories
  module Callable
    extend ActiveSupport::Concern

    included do
      def initialize(args = {})
        @params = args
      end

      private

      attr_reader :params

      def resource_errors(resource_with_errors)
        {}.merge(errors: resource_with_errors.errors.full_messages)
      end
  
      def serialize(serialize_resource, options = {})
        ActiveModelSerializers::SerializableResource
          .new(serialize_resource, options)
          .as_json
      end
    end

    class_methods do
      def call(args = {})
        new(args).call
      end
    end  
  end
end