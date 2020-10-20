# docker-web-template-nginx-ssl

## Description
Creates an instance of a nginx server with self-signed certificates.
It will serve .php, .html, .htm files.

## Tech stack
- fast php
- openssl

## Docker stack
- docker-compose
- nginx:alpine

## Prerequisites
- docker installed
- docker-compose installed
- openssl installed
- any server/service using port 80 be disabled

## To run
Be sure when running this command, you are in the folder
with docker-compose.yml file.

```docker-compose up -d --build```

Go to <https://localhost>

## Files
- default.conf

This is where the nginx conf; also the domain name can be changed here.

- docker-compose.yml

This sets the ports.

- web.dockerfile
  - Copies over files in ./src to server
  - Copies default.conf to server
  - Copies certificates to server

##  To create a new Self-Signed SSL Certificate, use the openssl req command:

> openssl req -newkey rsa:4096 \
>              -x509 \
>              -sha256 \
>              -days 3650 \
>              -nodes \
>              -out example.crt \
>              -keyout example.key

```-newkey rsa:4096``` - Creates a new certificate request and 4096 bit RSA key. The default one is 2048 bits.

```-x509``` - Creates a X.509 Certificate.

```-sha256``` - Use 265-bit SHA (Secure Hash Algorithm).

```-days 3650``` - The number of days to certify the certificate for. 3650 is ten years. You can use any positive integer.

```-nodes``` - Creates a key without a passphrase.

```-out example.crt``` - Specifies the filename to write the newly created certificate to. You can specify any file name.

```-keyout example.key``` - Specifies the filename to write the newly created private key to. You can specify any file name.
