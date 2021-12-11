#!/bin/bash
BASEDIR=$(pwd)
CRONTABLINE="0 12 * * * $BASEDIR/ssl_renew.sh >> /var/log/cron.log 2>&1"
export $(grep -v '#.*' .env | xargs);
sudo find ./themes -type f -exec chmod u=rw,g=r,o=r {} +
sudo find ./themes -type d -exec chmod u=rwx,g=rx,o=rx {} +
sudo chown -R www-data:www-data ./themes
sudo find ./plugins -type f -exec chmod u=rw,g=r,o=r {} +
sudo find ./plugins -type d -exec chmod u=rwx,g=rx,o=rx {} +
sudo chown -R www-data:www-data ./plugins
sed -i -e "s|example.com|${DOMAIN_NAME}|g;" nginx-conf/nginx.conf;
sed -i -e "s|example.com|${DOMAIN_NAME}|g;" nginx-conf-certbot/nginx.conf;
docker-compose -f docker-compose_initial_ssl.yml up -d;
docker-compose up --force-recreate --no-deps certbot;
docker-compose stop webserver;
curl -sSLo nginx-conf/options-ssl-nginx.conf https://raw.githubusercontent.com/certbot/certbot/master/certbot-nginx/certbot_nginx/_internal/tls_configs/options-ssl-nginx.conf;
docker-compose up -d --force-recreate --no-deps webserver
docker cp ./themes webserver:/var/www/html/wp-content
docker cp ./plugins webserver:/var/www/html/wp-content
(crontab -u $(whoami) -l; echo "$CRONTABLINE" ) | crontab -u $(whoami) -
