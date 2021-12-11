#!/bin/bash
BASEDIR=$(pwd)
DOCKER_LOCATION=$(which docker)
DOCKER_COMPOSE_LOCATION=$(which docker-compose)
COMPOSE="$DOCKER_COMPOSE_LOCATION --no-ansi"
DOCKER=$DOCKER_LOCATION
cd $BASEDIR
$COMPOSE run certbot renew && $docker-compose_location kill -s SIGHUP webserver
$DOCKER system prune -af