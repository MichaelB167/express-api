#!/bin/sh
TOKEN='S6ZGbL2O3+bo1ZnRsXBgn+mAIBn8im9VtigxezNPlC4=--+75+xn1NydXrw8wq6+jzZxj2nqhyI3zLdGwkPrpN5Hs='
ID='57334cb86753dc55618c525e'
curl --include --request DELETE http://localhost:3000/sign-out/$ID \
  --header "Authorization: Token token=$TOKEN"
