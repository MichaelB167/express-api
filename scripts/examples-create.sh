#!/bin/sh
TOKEN='N63aKwetEA4HlBRnBDIqnPmSRofUcH8Rb/yEqScsW50=--GowNbOg02M3fpdI15MzERIdpzJqWIAsLWS5n3lI4w5I='
curl --include --request POST http://localhost:3000/examples \
  --header "Authorization: Token token=$TOKEN" \
  --header "Content-Type: application/json" \
  --data '{
    "example": {
      "text": "test example"
    }
  }'
