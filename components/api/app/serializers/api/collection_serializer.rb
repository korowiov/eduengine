module Api
  class CollectionSerializer
    def initialize(objects, serializer, **kwargs)
      @objects    = objects
      @serializer = serializer
      @context    = kwargs
    end

    def call
      objects.map do |object| 
        serializer.new(object, context).serializable_hash
      end
    end

    private

    attr_reader :objects, :serializer, :context
  end
end