# frozen_string_literal: true

module Mutations
  class CreateComment < BaseMutation
    field :comment, Types::CommentType, null: false
    field :errors, String, null: false

    argument :body, String, required: true
    argument :postId, Integer, required: true

    def resolve(postId: postId, body: body)
      user = User.first
      post = Post.find_by(id: postId)
      if post
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
      else
        {
          comment: nil,
          errors: "Post Not Found"
        }
      end
    end
  end
end
