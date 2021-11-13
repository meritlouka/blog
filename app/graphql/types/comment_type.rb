# frozen_string_literal: true

module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :body, String, null: true
    field :user, UserType, null: true
    field :post, PostType, null: true
    field :reactions, [ReactionType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

  end
end
