# frozen_string_literal: true

require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe UpdatePost, type: :request do
      describe '.resolve' do
        it 'update a post' do
          user = create(:user)
          post = create(:post)
          post '/graphql',
               params: { query: query(postId: post.id, title: 'title Post update', body: 'body Post update') }

          expect(post.reload).to have_attributes(
            'body' => 'body Post update',
            'title' => 'title Post update'
          )
        end

        it 'returns a post' do
          user = create(:user)
          post = create(:post)
          post '/graphql',
               params: { query: query(postId: post.id, title: 'title Post update', body: 'body Post update') }
          json = JSON.parse(response.body)
          data = json['data']['updatePost']

          expect(data).to include(
            'post' => {
              'body' => 'body Post update',
              'title' => 'title Post update'
            }
          )
        end
      end

      def query(postId:, title:, body:)
        <<~GQL
          mutation {
            updatePost(
              input:{
                title: "#{title}",
                body: "#{body}",
                postId: #{postId}
              }
            ) {
              post {
                title
                body
              }
            }
          }
        GQL
      end
    end
  end
end
