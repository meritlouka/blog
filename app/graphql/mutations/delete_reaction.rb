module Mutations
  class DeleteReaction < BaseMutation
    field :success, String, null: true
    field :errors, String, null: true

    argument :reactionId, Integer, required: true

    def resolve(reactionId:)
      reaction = Reaction.find(reactionId)
      if reaction && reaction.delete
        {
          success: true,
        }
      else
        {
          success: false,
          errors: "Not Found"
        }
      end
    end
  end
end
