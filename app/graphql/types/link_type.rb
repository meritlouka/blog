module Types
  class LinkType < Types::BaseObject
    field :id, ID, null: false
    field :url, String, null: true
    field :description, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
