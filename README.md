# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# mutation {
#     createPost(
#      input:
#       {
#         title: "art1",
#         body: "art1111111111111"
#       }
#     ){
#       post{
#         id
#         title
#         body
#       }
#     }
# }

# query{
#   posts{
#     id title body
#   }
# }



# mutation{
#   createComment(
#     input:
#     {
#     body: "test",
#     postId: 1
#   }
#   )
#   {
#     comment{
#       id body
#       }
#   }

# }

# query{
#   comments{
#     id  body
#   }
# }


# mutation{
#   updatePost(
#     input:
#     {
#     title: "new",
#     body: "test",
#     postId: 1
#   }
#   )
#   {
#     post{
#       id title body
#       }
#   }
# }
