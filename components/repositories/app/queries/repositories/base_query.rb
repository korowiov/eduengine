module Repositories
  class BaseQuery
    class << self
      def set_relation(relation)
        @relation = relation
      end

      def relation
        raise NotImplementedError if @relation.nil?

        @relation
      end

      def override_relation(current_relation = nil)
        set_relation(current_relation) if current_relation.present?
        yield
      end
    end
  end
end