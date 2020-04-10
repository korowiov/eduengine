require Repositories::Engine.root.join('app', 'models', 'repositories', 'subject')

module Repositories
  class Subject
    include Repositories::Validations::SubjectValidation

    def extended_label
      if root?
        name
      else
        "#{parent.name}/#{name}"
      end
    end

    before_validation do
      if self.ancestry.eql?('')
        self.ancestry = nil
      end
    end

    def parent_enum
      Repositories::Subject
        .where.not(id: id)
        .map do |subject| 
          [subject.name, subject.id]
        end
    end

    rails_admin do
      field :id
      field :name
      field :icon_code do
        label do
          'Icon'
        end
      end
      field :ancestry, :enum do
        enum_method do
          :parent_enum
        end
      end
    end
  end
end