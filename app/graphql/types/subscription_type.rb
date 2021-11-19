# frozen_string_literal: true

module Types
  class SubscriptionType < GraphQL::Schema::Object
    field :post_added, Types::PostType, null: false, description: 'A post was added'
    field :post_updated, Types::PostType, null: false, description: 'A post was added'

    def post_added; end

    def post_updated; end
  end
end
