module Mutations
  class DeletePost < BaseMutation
    field :success, String, null: true
    field :errors, String, null: true

    argument :postId, Integer, required: true

    def resolve(postId:)
      post = Post.find(postId)
      if post && post.delete
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
