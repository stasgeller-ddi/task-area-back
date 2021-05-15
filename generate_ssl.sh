#!/usr/bin/env bash

mkdir -p ./config/jwt
password=087aee5f85982fc356f19292d13fd2e5
openssl genpkey -out ./config/jwt/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096 -pass pass:$password
openssl pkey -in ./config/jwt/private.pem -out ./config/jwt/public.pem -pubout -passin pass:$password
