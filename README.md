# README
test pr-agent
Blog prototype using graphql and mysql:-

Setup the project
```
docker-compose build
```
Raise the containers
```
docker-compose up
```
To Enter Inside the container
```
docker exec -it blog_app_1 /bin/bash
```
Create Database
```
bundle exec rake db:create
```
Migrate Database
```
bundle exec rake db:migrate
```
Seed Database
```
bundle exec rake db:seed
```
Run test cases
```
bundle exec rspec
```


Created End Points:-
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
Todo:-
Live Updates on post changes
