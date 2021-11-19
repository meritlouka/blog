# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe DeletePost, type: :request do
      describe '.resolve' do
        it 'destroy a post' do
          user = create(:user)
          post = create(:post)

          expect do
            post '/graphql', params: { query: query(postId: post.id) }
          end.to change { Post.count }.by(-1)
        end

        it 'returns a success' do
          user = create(:user)
          post = create(:post)
          post '/graphql', params: { query: query(postId: post.id) }
          json = JSON.parse(response.body)
          data = json['data']['deletePost']

          expect(data).to include(
            {
              'success' => 'true',
              'errors' => '[]'
            }
          )
        end
      end

      def query(postId:)
        <<~GQL
          mutation {
            deletePost(
              input:{
                postId: #{postId}
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
