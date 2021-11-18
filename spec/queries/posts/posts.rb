require 'rails_helper'

module Queries
  module Posts
    RSpec.describe Post, type: :request do
      describe '.resolve' do
        it 'returns posts for provided id' do
            post = create(:post)
            post '/graphql', params: { query: query(id: post.id) }

            json = JSON.parse(response.body)
            data = json['data']['posts']

            expect(data).to include(
              {'id'          => post.id.to_s,
              'body'        => post.body,
              'title'       => post.title}
            )
        end
        it 'returns posts with comments and reactions for provided id ' do
            post = create(:post)
            comment = create(:comment, post: post)
            user = create(:user)
            reaction = create(:reaction, reactionable: comment, user: user, name: 2)
            post '/graphql', params: { query: query_nest(id: post.id) }

            json = JSON.parse(response.body)
            data = json['data']['posts']
            expect(data).to include(
              {
                'id'          => post.id.to_s,
                'body'        => post.body,
                'title'       => post.title,
                'comments'    => [{
                  'body' => comment.body,
                  'reactions' => [{
                      'name' => reaction.name,
                      'user' => {
                        'username' => user.username
                      }
                    }]
                }]
              }
            )
        end
      end

      def query(id:)
        <<~GQL
          query {
            posts(id: #{id}) {
              id
              body
              title
            }
          }
        GQL
      end
      def query_nest(id:)
        <<~GQL
          query {
            posts(id: #{id}) {
              id
              body
              title
              comments{
                body
                reactions{
                  name
                  user{
                    username
                  }
                }
              }
            }
          }
        GQL
      end
    end
  end
end