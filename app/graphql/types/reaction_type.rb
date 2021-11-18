module Types
  class ReactionType < Types::BaseObject
    field :id, ID, null: false
    field :name, ReactionNameType, null: true
    field :reactionable, ReactionableType, null: false
    field :user, UserType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
