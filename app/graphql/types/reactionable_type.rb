module Types
  class ReactionableType < Types::BaseUnion
    possible_types Types::CommentType
    def self.resolve_type(object, context)
        if object.is_a?(Comment)
          Types::CommentType
        end
    end
  end
end
