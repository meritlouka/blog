# frozen_string_literal: true

module Types
  class ReactionableType < Types::BaseUnion
    possible_types Types::CommentType
    def self.resolve_type(object, _context)
      Types::CommentType if object.is_a?(Comment)
    end
  end
end
