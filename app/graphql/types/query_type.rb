# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :posts, [PostType], null: true do
      argument :id, Integer, required: false
    end
    field :users, [UserType], null: true do
      argument :id, Integer, required: false
    end
    field :comments, [CommentType], null: true

    def comments
      Comment.all
    end

    def posts(id:)
      if id
        Post.where(id: id)
      else
        Post.all
      end
    end

    def users(id:)
      if id
        User.where(id: id)
      else
        User.all
      end
    end
  end
end
