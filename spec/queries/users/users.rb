# frozen_string_literal: true

require 'rails_helper'

module Queries
  module Users
    RSpec.describe User, type: :request do
      describe '.resolve' do
        it 'returns posts for user' do
          user = create(:user)
          post = create(:post, user: user)
          post '/graphql', params: { query: query(id: user.id) }

          json = JSON.parse(response.body)
          data = json['data']['users']

          expect(data).to include(
            {
              'id' => user.id.to_s,
              'username' => user.username,
              'posts' => [{
                'id' => post.id.to_s,
                'body' => post.body,
                'title' => post.title
              }]
            }
          )
        end
      end

      def query(id:)
        <<~GQL
          query {
            users(id: #{id}) {
              id
              username
              posts{
                id body title
              }
            }
          }
        GQL
      end
    end
  end
end
