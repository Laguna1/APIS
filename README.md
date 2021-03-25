# README
1.add gems, models, controllers, tests structure
2. add helper methods
`rails s` , run CLI
/# GET /todos
`curl http://localhost:3000/todos`

/# POST /todos
`curl --header "Content-Type: application/json" --request POST --data '{"title": "Lara", "created_by": "1"}' http://localhost:3000/todos`
/PUT /todos/:id
`curl --header "Content-Type: application/json" --request PUT --data '{"title": "Beethoven"}' http://localhost:3000/todos/1`
/# DELETE /todos/:id
`curl --header "Content-Type: application/json" --request DELETE http://localhost:3000/todos/1`

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
