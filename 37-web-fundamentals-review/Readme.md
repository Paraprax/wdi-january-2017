# Review of Web Fundamentals

## Agenda
1. Client/server architecture and request/response cycle
2. MVC architecture & where code should go
3. Debugging in Rails
4. Exploring a new (old) Rails app
5. Adding a new feature to a legacy app

### Client-server architecture
![Client-server architecture](http://bramus.github.io/ws1-sws-course-materials/assets/02/client-server-model.png)

### MVC
![MVC architecture](https://realpython.com/images/blog_images/mvc_diagram_with_routes.png)


### Where code should go
#### Views
Primary responsibility: "Display logic"

- stuff the user should see
- avoid calculations, setting variables, long method chains - try to offload to model
- can also offload complex display logic to *helpers*

#### Controllers
Primary responsibility: Responding to client's request

- logic about what the response should be (what to render or where to redirect)
- decisions based on request (params) or session
- calling model methods to pull data from db according to needs to view
  - ie. setting up instance variables for view
  - aim for one-liners and offload logic to model

#### Models
Primary responsibility: Everything else!

- "business logic"
- db logic
- associations, validations
- define methods that can be called from controllers and views
- these are the classes that grow as your apps grow in complexity

### Exploring an unfamiliar legacy app
- read tests
- `rails routes` - any GET routes are URLs you can look at
- run server and poke around - read log to find out what controller actions and views are being used
- `schema.rb`