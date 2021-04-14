
| HTTP VERB  | Route           | Action        |
| GET        | /sushis         | sushis#index  |
| GET        | /sushis/:id     | sushis#show   |
| GET        | /sushi/new      | sushis#new    |
| POST       | /sushis         | sushis#create |
| GET        | /sushis/:id/edit| sushis#edit   |
| PATCH      | /sushis/:id     | sushis#update |
| DELETE     | /sushis/:id     | sushis#destroy|