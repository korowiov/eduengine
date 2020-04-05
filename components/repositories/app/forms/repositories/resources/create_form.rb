module Repositories
  module Resources
    class CreateForm < Repositories::BaseForm
      properties :author, :subject, :name, :description, :type, :tag_list, 
                 :education_level
      property :author_uuid, virtual: true
      property :subject_id, virtual: true
      property :tags, virtual: true

      validates :author, presence: true
      validates :subject, presence: true
      validates :name, presence: true
      validates :description, presence: true
      validates :type, inclusion: { in: %w[quiz flashcards_deck] }
      validates :education_level, inclusion: { in: %w[grade_4_6 grade_7_8 grade_9_12] }
      validate :valid_tag_list

      private

      def author_uuid=(value)
        super(value)
        author_resource = Repositories::Accounts::FindQuery.by_uuid(value)
        self.author = author_resource
      end

      def subject_id=(value)
        super(value)
        subject_resource = Repositories::Subjects::FindQuery.by_id(value)
        self.subject = subject_resource
      end

      def tags=(value)
        super(value)
        self.tag_list = value || []
      end

      def valid_tag_list
        errors.add(:base, :tags_invalid) unless array_tags?
        errors.add(:base, :tags_invalid) if empty_values?
      end

      def array_tags?
        tag_list.is_a? Array
      end

      def empty_values?
        errors.empty? && tag_list&.any? { |value| value.blank? }
      end
    end
  end
end