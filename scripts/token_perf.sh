#!/bin/bash

source ~/overcloudrc

while :;
do
curl -s -o /dev/null -w "%{time_total}" -i -H "Content-Type: application/json" -d '
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
  "${OS_AUTH_URL}/auth/tokens" ; echo
done
