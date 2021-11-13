# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :delete_reaction, mutation: Mutations::DeleteReaction
    field :create_reaction, mutation: Mutations::CreateReaction
    field :updatePost, mutation: Mutations::UpdatePost
    field :createComment, mutation: Mutations::CreateComment
    field :createPost, mutation: Mutations::CreatePost

  end
end
