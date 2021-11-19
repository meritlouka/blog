# frozen_string_literal: true

module Mutations
  class UpdateComment < BaseMutation
    field :comment, Types::CommentType, null: false

    argument :commentId, Integer, required: true
    argument :body, String, required: true

    def resolve(commentId: commentId, body: body)
      comment = Comment.find(commentId)
      saved = comment.update(body: body)
      if saved
        {
          comment: comment,
          errors: []
        }
      else
        {
          comment: nil,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end
