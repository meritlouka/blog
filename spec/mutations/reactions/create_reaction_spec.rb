# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Reactions
    RSpec.describe CreateReaction, type: :request do
      describe '.resolve' do
        it 'creates a reaction' do
          user = create(:user)
          comment = create(:comment)
          expect do
            post '/graphql', params: { query: query(commentId: comment.id, name: 0) }
          end.to change { Reaction.count }.by(1)
        end

        it 'returns a reaction' do
          user = create(:user)
          comment = create(:comment)
          post '/graphql', params: { query: query(commentId: comment.id, name: 0) }
          json = JSON.parse(response.body)
          data = json['data']['createReaction']

          expect(data).to include(
            'reaction' => {
              'name' => Reaction.last.name
            }
          )
        end
      end

      def query(commentId:, name:)
        <<~GQL
          mutation {
            createReaction(
              input:{
                commentId: #{commentId},
                name: #{name}
              }
            ) {
              reaction {
                name
              }
            }
          }
        GQL
      end
    end
  end
end
