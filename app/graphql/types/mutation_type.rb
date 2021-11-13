# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :updatePost, mutation: Mutations::UpdatePost
    field :createComment, mutation: Mutations::CreateComment
    field :createPost, mutation: Mutations::CreatePost

  end
end
