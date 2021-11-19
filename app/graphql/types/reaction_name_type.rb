# frozen_string_literal: true

# app/graphql/types/media_category.rb

module Types
  class ReactionNameType < Types::BaseEnum
    value 'like', value: 'like'
    value 'smile', value: 'smile'
    value 'up', value: 'up'
  end
end
