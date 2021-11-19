# frozen_string_literal: true

module Mutations
  class CreatePost < BaseMutation
    field :post, Types::PostType, null: false

    argument :title, String, required: true
    argument :body, String, required: true

    def resolve(title:, body:)
      user = User.first
      post = user.posts.new(title: title, body: body)
      if post.save
        # BlogSchema.subscriptions.trigger("postAdded", {}, post)
        {
          post: post,
          errors: []
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
