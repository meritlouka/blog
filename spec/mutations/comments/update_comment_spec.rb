# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Commentss
    RSpec.describe UpdateComment, type: :request do
      describe '.resolve' do
        it 'update a comment' do
          user = create(:user)
          post = create(:post)
          comment = create(:comment, post: post)
          post '/graphql', params: { query: query(commentId: comment.id, body: 'body Comment update') }

          expect(comment.reload).to have_attributes(
            'body' => 'body Comment update'
          )
        end

        it 'returns a comment' do
          user = create(:user)
          post = create(:post)
          comment = create(:comment, post: post)
          post '/graphql', params: { query: query(commentId: comment.id, body: 'body Comment update') }
          json = JSON.parse(response.body)
          data = json['data']['updateComment']

          expect(data).to include(
            'comment' => {
              'body' => 'body Comment update'
            }
          )
        end
      end

      def query(commentId:, body:)
        <<~GQL
          mutation {
            updateComment(
              input:{
                body: "#{body}",
                commentId: #{commentId}
              }
            ) {
              comment {
                body
              }
            }
          }
        GQL
      end
    end
  end
end
