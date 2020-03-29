module Api
  class SubjectsSerializer < Api::Patterns::Serializer    
    attributes :id, :name, :icon_code
  end
end