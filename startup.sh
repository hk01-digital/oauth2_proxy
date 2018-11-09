#!/bin/sh

if [ ! -f /etc/proxy_pass_domain.conf ]; then
    envsubst < /etc/nginx/proxy_pass_domain.conf.template > /etc/nginx/proxy_pass_domain.conf
fi

service nginx start

./oauth2_proxy \
   --email-domain="$OAUTH2_PROXY_EMAIL_DOMAIN"  \
   --upstream=http://127.0.0.1:80/ \
   --cookie-secret=$OAUTH2_PROXY_COOKIE_SECRET \
   --client-id=$OAUTH2_PROXY_CLIENT_ID \
   --client-secret=$OAUTH2_PROXY_CLIENT_SECRET \
   --http-address=0.0.0.0:4180 \
   --set-xauthrequest \
   --authenticated-emails-file=./email_list
