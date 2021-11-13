module Mutations
  class UpdatePost < BaseMutation
    field :post, Types::PostType, null: false

    argument :postId, Integer, required: true
    argument :title, String, required: true
    argument :body, String, required: true

    def resolve(postId: postId, title: title, body: body)
      post = Post.find(postId)
      saved = post.update(title: title, body: body)
      if saved
        {
          post: post,
          errors: [],
        }
      else
        {
          post: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end