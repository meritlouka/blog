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
# 1 - Fetch / list all posts made by one user
# query{
#   users(id: 1){
#     id username
#     posts{
#       id body
#     }
#   }
# }
* ...
# 2 - Fetch / display a single post
# query{
#   posts(id: 1){
#     id title body
#   }
# }
* ...
#3 - Create, update, and delete posts
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
# mutation{
#   deletePost(
#     input:
#     {
#     postId: 1
#   }
#   )
#   {
#     success
#   }
# }
# 4 - Fetch / list all comments for a post together with the reactions on these comments
# query{
#   posts(id: 1){
#     id title body
#     comments{
#       id body
#       reactions{
#         id,name
#         user{
#           username
#         }
#       }
#     }
#   }
# }
# 5 - Create, update and delete comments on one post
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
# mutation{
#   updateComment(
#     input:
#     {
#     body: "testtest",
#     commentId: 4
#   }
#   )
#   {
#     comment{
#       id body
#       }
#   }
# }
# mutation{
#   deleteComment(
#     input:
#     {
#     commentId: 1
#   }
#   )
#   {
#     success
#   }
# }
#6- Create and delete reactions for one comment. Possible reactions are like, smile and
#thumbs up.
# mutation{
#   createReaction(
#     input:
#     {
#     commentId: 1,
#     name: 0
#     }
#   )
#   {
#     reaction{
#       id name
#       }
#   }
# }
# mutation{
#   deleteReaction(
#     input:
#     {
#     reactionId: 1
#     }
#   ){
#     success
#   }
# }


