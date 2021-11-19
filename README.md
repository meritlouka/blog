# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

1- Setup the project
```
docker-compose build
```
2- Inside the container
```
docker exec -it blog_app_1 /bin/bash
```
3- Create Database
```
bundle exec rake db:create
```
4- Migrate Database
```
bundle exec rake db:migrate
```
5- Seed Database
```
bundle exec rake db:seed
```
6- Run test cases
```
bundle exec rspec
```



```
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
# 2 - Fetch / display a single post
# query{
#   posts(id: 1){
#     id title body
#   }
# }
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

```
