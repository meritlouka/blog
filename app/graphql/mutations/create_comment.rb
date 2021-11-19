# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    field :comment, Types::CommentType, null: false

    argument :body, String, required: true
    argument :postId, Integer, required: true

    def resolve(postId: postId, body: body)
      user = User.first
      post = Post.find(postId)
      comment = post.comments.new(body: body, user_id: user.id)

      if comment.save
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
