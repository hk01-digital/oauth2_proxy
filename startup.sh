#!/bin/sh

service nginx start

./oauth2_proxy \
   --email-domain="$OAUTH2_PROXY_EMAIL_DOMAIN"  \
   --upstream=http://127.0.0.1:80/ \
   --cookie-secret=$OAUTH2_PROXY_COOKIE_SECRET \
   --client-id=$OAUTH2_PROXY_CLIENT_ID \
   --client-secret=$OAUTH2_PROXY_CLIENT_SECRET \
   --http-address=0.0.0.0:4180
   --set-xauthrequest
