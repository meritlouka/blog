require 'rails_helper'

module Mutations
  module Posts
    RSpec.describe CreatePost, type: :request do
      describe '.resolve' do
        it 'creates a post' do
          user = create(:user)
          expect do
            post '/graphql', params: { query: query(title: "title Post", body: "body Post") }
          end.to change { Post.count }.by(1)
        end

        it 'returns a book' do
          user = create(:user)
          post '/graphql', params: { query: query(title: "title Post", body: "body Post") }
          json = JSON.parse(response.body)
          data = json['data']['createPost']

          expect(data).to include(
            "post" => {
              'body'            => 'body Post',
              'title'           => 'title Post'
            }
          )
        end
      end

      def query(title:, body:)
        <<~GQL
          mutation {
            createPost(
              input:{
                title: "#{title}",
                body: "#{body}"
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