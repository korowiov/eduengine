module Api
  module Resources
    module Index
      class Params
        ATTRS = %i[sort subjects].freeze

        include ActiveModel::Validations
        attr_reader *ATTRS

        validates :sort, inclusion: { in: %w[date_asc date_desc] },
                         allow_nil: true
        validate :subjects_is_array, if: :subjects?

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
      end
    end
  end
end