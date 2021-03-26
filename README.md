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
 - 5. Authorize Api Request
   - add Auth folder, tests and helpers
 - 6. Authenticate User
 - 7. Add Authentication Controller, tests, add rout, add Users controller tests and rout
 - 8. Implement a callback in the application controller which authenticates every request
 - 9. Skip request authentication for authentication and signup actions, update request tests
 - Part 3:
 - 10 Versioning -Add a route constraint, Namespace the controllers
   - update routes,
   - replace todos and items controllers
   `mv app/controllers/{todos_controller.rb,items_controller.rb} app/controllers/v1`,
   - define the controllers in the v1 namespace
   `rails c` create a new user `user1=User.new(name: "Oksana", email: "oksana@mail", password: "11111
111", password_confirmation: "11111111")`
`user1.save`
`TRANSACTION (0.2ms)  BEGIN
  User Create (99.5ms)  INSERT INTO "users" ("name", "email", "password_digest", "created_at", "updated_at") VALUES ($1, $2, $3, $4, $5) RETURNING "id"  [["name", "Oksana"], ["email", "oksana@mail"], ["password_digest", "$2a$12$swyuoW4z5QZOth8aP5APberMcuHUqrxLVGuYuqAX9WWQFy0v60UKi"], ["created_at", "2021-03-26 21:05:37.446596"], ["updated_at", "2021-03-26 21:05:37.446596"]]
  TRANSACTION (47.9ms)  COMMIT
=> true`
 By command line:
 `curl --header "Content-Type: application/json" --request POST --data '{"name": "Oksana2", "email": "oksana2@mail", "password": "11111111", "password_digest": "11111111"}' http://localhost:3000/signup`
 Result:
 {"message":"Account created successfully","auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MTY4ODE4MjV9.5hNbruNzvp0JBznXx-3lWrNJ1h-it9CgjaQymsb6GKg"}
 `curl --location --request POST 'http://localhost:3000/auth/login?email=oksana2@mail&password=11111111'`
 {"auth_token":"eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MTY4ODMyNDV9.JmjYilI4Ss3Pz7PcI2iFxJ7oIxvb2zE0WvfMiUaP1Lg"}
 request 
`curl --location --request GET 'http://localhost:3000/v1/todos' --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MTY4ODMyNDV9.JmjYilI4Ss3Pz7PcI2iFxJ7oIxvb2zE0WvfMiUaP1Lg'`
message:
[{"id":3,"title":"For deleting haha","created_by":"2","created_at":"2021-03-25T19:33:02.179Z","updated_at":"2021-03-25T19:33:02.179Z"},{"id":4,"title":"Hello API","created_by":"2","created_at":"2021-03-25T20:00:12.036Z","updated_at":"2021-03-25T20:00:12.036Z"},{"id":5,"title":"Microverse API","created_by":"2","created_at":"2021-03-25T20:04:59.903Z","updated_at":"2021-03-25T20:04:59.903Z"}]
request `curl --location --request GET 'http://localhost:3000/v2/todos' --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MTY4ODMyNDV9.JmjYilI4Ss3Pz7PcI2iFxJ7oIxvb2zE0WvfMiUaP1Lg'`
message: {"message":"Hello there"}





 `rubocop \
  --require rubocop-rspec \
  --only FactoryBot/AttributeDefinedStatically \
  --auto-correct`
'
http :3000/todos Accept:'application/vnd.todos.v1+json' Authorization:'ey...HnLw2bYQbK0g'

curl --location --request GET 'http://localhost:3000/v1/todos' --header 'Authorization: eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyLCJleHAiOjE2MTY4ODMyNDV9.JmjYilI4Ss3Pz7PcI2iFxJ7oIxvb2zE0WvfMiUaP1Lg'