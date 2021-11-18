require 'rails_helper'

module Mutations
  module Comments
    RSpec.describe CreateComment, type: :request do
      describe '.resolve' do
        it 'creates a comment' do
          user = create(:user)
          post = create(:post)
          expect do
            post '/graphql', params: { query: query(postId: post.id, body: "body Comment") }
          end.to change { Comment.count }.by(1)
        end

        it 'returns a comment' do
          user = create(:user)
          post = create(:post)
          post '/graphql', params: { query: query(postId: post.id, body: "body Comment") }
          json = JSON.parse(response.body)
          data = json['data']['createComment']

          expect(data).to include(
            "comment" => {
              'body'            => 'body Comment',
            }
          )
        end
      end

      def query(postId:, body:)
        <<~GQL
          mutation {
            createComment(
              input:{
                postId: #{postId},
                body: "#{body}"
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