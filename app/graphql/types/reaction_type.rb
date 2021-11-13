module Types
  class ReactionType < Types::BaseObject
    field :id, ID, null: false
    field :name, Integer, null: true
    field :reactionable, ReactionableType, null: false
    field :user_id, Integer, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false



  end
end
