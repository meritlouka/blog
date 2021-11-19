# frozen_string_literal: true

module Mutations
  class CreateReaction < BaseMutation
    field :reaction, Types::ReactionType, null: false
    field :errors, String, null: false

    argument :commentId, Integer, required: true
    argument :name, Integer, required: true

    def resolve(commentId:, name:)
      comment = Comment.find_by(id: commentId)
      user = User.first
      if comment
        reaction = comment.reactions.new(user_id: user.id, name: name)
        if reaction.save
          {
            reaction: reaction,
            errors: ""
          }
        else
          {
            reaction: nil,
            errors: reaction.errors.full_messages
          }
        end
      else
        {
          reaction: nil,
          errors: "Comment Not Found"
        }
      end
    end
  end
end
