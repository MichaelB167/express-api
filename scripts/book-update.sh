#!/bin/sh
TOKEN='Gs+L/WHkFNsyO7FHFBZn9+oDlhhdU+kv78ig4SFfOK0=--QomZFAX7bKN/01pL8sTkeOP4a8Mv+qfT8an4Lyx758o='
ID='573360218ccbadfb6a380bf1'
curl --include --request PATCH http://localhost:3000/books/$ID \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "book": {
      "title": "The art of the deal",
      "author": "Dtrump",
      "price": 10000000
    }
  }'
