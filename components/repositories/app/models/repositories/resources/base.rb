module Repositories
  module Resources
    class Base < Repositories::Resource
      self.abstract_class = true

      class << self
        def sti_name
          to_s.demodulize
        end
      end
    end
  end
end