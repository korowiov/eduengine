module Api
  class ResourcesSerializer < Api::Patterns::Serializer
    attributes :uuid, :name, :published

    def published
      date = object.published_at
      date.strftime("%F %H:%M")
    end
  end
end