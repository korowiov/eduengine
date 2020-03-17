module Api
  module Resources
    module Index
      class Params
        ATTRS = %i[sort].freeze

        include ActiveModel::Validations
        attr_reader *ATTRS

        validates :sort, inclusion: { in: %w[date_asc date_desc] },
                         allow_nil: true

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
      end
    end
  end
end