# frozen_string_literal: true

require 'rails_helper'
module Mutations
  module Reactions
    RSpec.describe DeleteReaction, type: :request do
      describe '.resolve' do
        it 'destroy a reaction' do
          reaction = create(:reaction)
          expect do
            post '/graphql', params: { query: query(reactionId: reaction.id) }
          end.to change { Reaction.count }.by(-1)
        end

        it 'returns a success' do
          reaction = create(:reaction)
          post '/graphql', params: { query: query(reactionId: reaction.id) }
          json = JSON.parse(response.body)
          data = json['data']['deleteReaction']

          expect(data).to include(
            {
              'success' => 'true',
              'errors' => '[]'
            }
          )
        end
      end

      def query(reactionId:)
        <<~GQL
          mutation {
            deleteReaction(
              input:{
                reactionId: #{reactionId}
              }
            ){
                success
                errors
              }
          }
        GQL
      end
    end
  end
end
