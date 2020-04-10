module Repositories
  class BaseQuery
    class << self
      def set_initial_scope(initial_scope)
        @initial_scope = initial_scope
      end

      def initial_scope
        raise NotImplementedError if @initial_scope.nil?

        @initial_scope
      end
    end

    def initialize(scope = nil)
      @scope = scope || self.class.initial_scope
    end

    private

    attr_reader :scope
  end
end