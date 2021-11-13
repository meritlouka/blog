module Mutations
  class CreateReaction < BaseMutation
    field :reaction, Types::ReactionType, null: false

    argument :commentId, Integer, required: true
    argument :name, Integer, required: true

    def resolve(commentId:, name:)
      comment = Comment.find(commentId)
      user = User.first
      reaction = comment.reactions.new(user_id: user.id, name: name)
      if reaction.save
        {
          reaction: reaction,
          errors: [],
        }
      else
        {
          reaction: nil,
          errors: reaction.errors.full_messages
        }
      end
    end
  end
end
