# class CollectionSerializer
#   def initialize(objects, serializer, **kwargs)
#     @objects    = objects
#     @serializer = serializer
#     @context    = kwargs
#   end

#   def call
#     objects.map { |object| serializer.new(object, context).call }.compact
#   end

#   private

#   attr_reader :objects, :serializer, :context
# end