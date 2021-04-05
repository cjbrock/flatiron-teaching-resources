# REST

## Representational State Transfer
### 7 Restful Routes
| HTTP VERB  | Route           | Action |
| GET        | /todos          | index |
| GET        | /todos/new      | new   |
| GET        | /todos/:id      | show  |
| GET        | /todos/:id/edit | edit  |
| PUT/PATCH  | /todos/:id      | update |
| POST       | /todos          | create |
| DELETE     | /todos/:id      | destroy |

## MVC

### Model
- logic, communicates with the database, in charge of creating our objects

### View
- responsible for displaying data to our users and getting data from the user

### Controller
- works in between the model and view, accepts web requests from the view, sends them to the model, passes data to the view, holds all of our CRUD functions

- Generate project

- Talk about gemfile adjustments 
    - update AR version
    - remove SQL version
    - talk about potential thin source