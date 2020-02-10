module Repositories
  module Resources
    class CreateForm < Repositories::BaseForm
      properties :author, :name, :description, :type
      property :author_id, virtual: true

      validates :author, presence: true
      validates :name, presence: true
      validates :description, presence: true
      validates :type, inclusion: { in: %w[quiz] }

      private

      def author_id=(value)
        super(value)
        author_resource = Repositories::Account.find_by(id: value)
        self.author = author_resource
      end

    end
  end
end