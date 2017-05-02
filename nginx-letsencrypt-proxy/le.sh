#!/bin/bash
set -e

# 0) Make sure the right parameters are here
if [[ -z "${NGINX_SERVER_NAME}" ]]; then
  echo 'NGINX_SERVER_NAME is not specified. Aborting.'
  exit 1
fi

if [[ -z "${NGINX_EMAIL}" ]]; then
  echo 'NGINX_EMAIL is not specified. Aborting.'
  exit 1
fi

# 0.5) Start nginx for the first time
# TODO: maybe just do this if letsencrypt hasn't been initalized?
echo 'Starting initial nginx config.'
nginx

# 1) Check whether letsencrypt has already been initialized
echo "Testing whether letsencrypt has been initialized already."
if [[ ! -d "/etc/letsencrypt/live/${NGINX_SERVER_NAME}" ]]; then

  # 2) Initialize letsencrypt, if required
  echo "Initializing letsencrypt with certbot for '${NGINX_SERVER_NAME}'."
  # include --dry-run durign development
  letsencrypt certonly \
    -a webroot \
    -m ${NGINX_EMAIL} \
    -d ${NGINX_SERVER_NAME} \
    --agree-tos \
    --webroot-path=/usr/share/nginx/html/

else
  echo "Letsencrypt has been initialized; skipping certbot setup."
fi

# 2.5) Generate DH Params if needed
echo "Testing whether DHParams exist."
if [[ ! -f "/etc/ssl/certs/dhparam.pem" ]]; then

  # 2.75) Initialize DHParams if needed
  echo "Generating DHParams."
  openssl dhparam \
    -out /etc/ssl/certs/dhparam.pem \
    2048

else
  echo "DHParams exist; skipping DHParam setup."
fi

# 3) Install SSL-enabled config and restart nginx
echo "Applying SSL enabled nginx config"
cat /opt/site.conf | \
  sed -e "s/\\\$SERVER_NAME/${NGINX_SERVER_NAME}/" \
  > /etc/nginx/conf.d/default.conf

echo "Stopping nginx"
nginx -s stop

echo "Restarting nginx"
exec nginx -g 'daemon off;'
