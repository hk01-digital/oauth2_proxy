#!/bin/sh

   # ota 
#  ./oauth2_proxy \
#    --email-domain="hk01.com"  \
#    --upstream=http://127.0.0.1:80/ \
#    --cookie-secret=jJ7AGsLRKRYGzmQrByhyhDoG \
#    --client-id=11734952588-jo9ni2f7rca9tnp1h7vh5eo2hvmrrib1.apps.googleusercontent.com \
#    --client-secret=75kLikblpgdJoU0TpeZlbgzJ \
#    --http-address=0.0.0.0:4180 &


service nginx start

#simeon
# ./oauth2_proxy \
#    --email-domain="hk01.com"  \
#    --upstream=http://127.0.0.1:80/ \
#    --cookie-secret=jJ7AGsLRKRYGzmQrByhyhDoG \
#    --client-id=751201684376-8odol73jer44ng0r1f6pcc7iqq1k166a.apps.googleusercontent.com \
#    --client-secret=xjPDfrDKPO77aQuzcJnCqqXy \
#    --http-address=0.0.0.0:4180 &


./oauth2_proxy \
   --email-domain="$OAUTH2_PROXY_EMAIL_DOMAIN"  \
   --upstream=http://127.0.0.1:80/ \
   --cookie-secret=$OAUTH2_PROXY_COOKIE_SECRET \
   --client-id=$OAUTH2_PROXY_CLIENT_ID \
   --client-secret=$OAUTH2_PROXY_CLIENT_SECRET \
   --http-address=0.0.0.0:4180 &
