#!/bin/bash
BASEDIR=$(pwd)
crontab -u $(whoami) -l | grep -v "ssl_renew"  | crontab -u $(whoami) -
docker-compose down -v --rmi all --remove-orphans
