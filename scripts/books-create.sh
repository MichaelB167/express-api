#!/bin/sh
TOKEN='Gs+L/WHkFNsyO7FHFBZn9+oDlhhdU+kv78ig4SFfOK0=--QomZFAX7bKN/01pL8sTkeOP4a8Mv+qfT8an4Lyx758o='
curl --include --request POST http://localhost:3000/books \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "book": {
      "title": "title",
      "author": "authorName",
      "price": 12.99
    }
  }'

  curl --include --request POST http://localhost:3000/books \
    --header "Authorization: Token token=$TOKEN" \
    --header "Content-Type: application/json" \
    --data '{
      "book": {
        "title": "title2",
        "author": "authorName2",
        "price": 14
      }
    }'
