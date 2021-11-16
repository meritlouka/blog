module Mutations
  class DeleteComment < BaseMutation
    field :success, String, null: true
    field :errors, String, null: true

    argument :commentId, Integer, required: true

    def resolve(commentId:)
      comment = Comment.find(commentId)
      if comment && comment.delete
        {
          success: true,
          errors: [],
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
