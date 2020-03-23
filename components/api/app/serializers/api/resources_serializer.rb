module Api
  class ResourcesSerializer < Api::Patterns::Serializer
    attributes :uuid, :name, :published, :author, :subject, :tags

    def author
      AccountsSerializer.new(object.author)
    end

    def published
      date = object.published_at
      date&.strftime("%F %H:%M")
    end

    def subject
      SubjectsSerializer.new(object.subject)
    end

    def tags
      object.tags.pluck(:name)
    end
  end
end