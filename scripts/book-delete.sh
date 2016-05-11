#!/bin/sh

TOKEN='Gs+L/WHkFNsyO7FHFBZn9+oDlhhdU+kv78ig4SFfOK0=--QomZFAX7bKN/01pL8sTkeOP4a8Mv+qfT8an4Lyx758o='
ID='573354085b8213c0660822b5'
curl --include --request DELETE http://localhost:3000/books/$ID \
     --header "Authorization: Token token=$TOKEN" \
