# README

### Built with:
- Rails 6.1.3
- Postgresql

 - 1. add gems, models, controllers, tests structure
 - 2. add helper methods
`rails s` , run CLI
- Requests for todos:
 - /# GET /todos
`curl http://localhost:3000/todos`

 - /# POST /todos
`curl --header "Content-Type: application/json" --request POST --data '{"title": "Lara", "created_by": "1"}' http://localhost:3000/todos`
 - /PUT /todos/:id
`curl --header "Content-Type: application/json" --request PUT --data '{"title": "Beethoven"}' http://localhost:3000/todos/1`
 - /# DELETE /todos/:id
`curl --header "Content-Type: application/json" --request DELETE http://localhost:3000/todos/1`

- Requests for items:
 - /# GET /todos/:todo_id/items
 `curl http://localhost:3000/todos/2/items`
 - /# POST /todos/:todo_id/items
 `curl --header "Content-Type: application/json" --request POST --data '{"name": "Listen to the Symphony", "done": "false"}' http://localhost:3000/todos/2/items`
 - /# PUT /todos/:todo_id/items/:id
 `curl --header "Content-Type: application/json" --request PUT --data '{"done": "true"}' http://localhost:3000/todos/2/items/1`
 - /# DELETE /todos/:todo_id/items/:item_id
 `curl --header "Content-Type: application/json" --request DELETE http://localhost:3000/todos/2/items/1`
 - 3. Add User model name email password_digest
   - add tests for User model, gem 'bcrypt', validations and associations
   -  next steps (JsonWebToken - Encode and decode jwt tokens,
AuthorizeApiRequest - Authorize each API request,
AuthenticateUser - Authenticate users,
AuthenticationController - Orchestrate authentication process)
 - 4. Add gem 'jwt' and create 'app/lib/json_web_token.rb', define jwt singleton




 `rubocop \
  --require rubocop-rspec \
  --only FactoryBot/AttributeDefinedStatically \
  --auto-correct`