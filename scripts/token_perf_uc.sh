#!/bin/bash

source ~/stackrc

while :;
do
time curl -s -o /dev/null -i -H "Content-Type: application/json" -d '
{ "auth": {
    "identity": {
      "methods": ["password"],
      "password": {
        "user": {
          "name": "admin",
          "domain": { "id": "default" },
          "password": "'${OS_PASSWORD}'"
        }
      }
    }
  }
}' \
  "${OS_AUTH_URL}v3/auth/tokens" ; echo
done