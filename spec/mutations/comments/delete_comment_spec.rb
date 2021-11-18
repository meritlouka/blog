require 'rails_helper'

module Mutations
  module Comments
    RSpec.describe DeleteComment, type: :request do
      describe '.resolve' do
        it 'destroy a comment' do
          user = create(:user)
          post = create(:post)
          comment = create(:comment, post: post)
          expect do
            post '/graphql', params: { query: query(commentId: comment.id) }
          end.to change { Comment.count }.by(-1)
        end

        it 'returns a success' do
          user = create(:user)
          post = create(:post)
          comment = create(:comment, post: post)
          post '/graphql', params: { query: query(commentId: comment.id) }
          json = JSON.parse(response.body)
          data = json['data']['deleteComment']

          expect(data).to include(
            {
              'success'     => 'true',
              'errors'     => "[]"
            }
          )
        end
      end

      def query(commentId:)
        <<~GQL
          mutation {
            deleteComment(
              input:{
                commentId: #{commentId}
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