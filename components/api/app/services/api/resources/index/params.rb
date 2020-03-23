module Api
  module Resources
    module Index
      class Params
        ATTRS = %i[sort subjects types].freeze

        include ActiveModel::Validations
        attr_reader *ATTRS
        
        validates :sort, inclusion: { in: %w[date_asc date_desc] },
                         allow_nil: true
        validate :subjects_is_array, if: :subjects?
        validate :validate_allowed_types, if: :types?

        def initialize(params = {})
          instance_variables(params.slice(*ATTRS))
        end

        ATTRS.each do |attribute|
          define_method "#{attribute}?" do
            send(attribute).present?
          end
        end

        private

        def instance_variables(params_hsh)
          params_hsh.each do |name, value| 
            instance_variable_set("@#{name}", value)
          end
        end

        def subjects_is_array
          errors.add(:subjects, :invalid) unless subjects.is_a? Array
        end

        def validate_allowed_types
          unless types.is_a? Array
            errors.add(:types, :invalid)
            return
          end

          unless types.all? { |type| type.in?(allowed_types) }
            errors.add(:types, :invalid)
          end
        end

        def allowed_types
          %w[quiz flashcards_deck]
        end
      end
    end
  end
end