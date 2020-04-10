module Api
  class FlashcardsSerializer < Api::Patterns::Serializer
    attributes :uuid, :title, :front, :back
  end
end