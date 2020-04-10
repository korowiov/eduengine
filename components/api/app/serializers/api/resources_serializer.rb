module Api
  class ResourcesSerializer < Api::Patterns::Serializer
    attributes :uuid, :name, :education_level, :description, :published, 
               :author, :subjects, :tags

    def author
      AccountsSerializer.new(object.author)
    end

    def published
      date = object.published_at
      date&.strftime('%F %H:%M')
    end

    def subjects
      [].tap do |elements|
        unless object.subject.root?
          elements.push(SubjectsSerializer.new(object.subject.parent))
        end
        elements.push(SubjectsSerializer.new(object.subject))
      end
    end

    def tags
      object.assigned_tags.pluck(:name)
    end
  end
end