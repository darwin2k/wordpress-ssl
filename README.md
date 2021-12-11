# WORDPRESS WITH SSL 🚀

## Prerequisites
* Ubuntu
* Docker
* Docker-compose

## Features
* 🔐 SSL Letsencrypt certificate
* ♻️ Renewing Certificates automatically 
* 🔐 Nginx security parameters 
* 🦾 Wordpress version 5.8.2

create .env
```
MYSQL_ROOT_PASSWORD=root_password
MYSQL_USER=wordpress
MYSQL_PASSWORD=wordpress_password
LETSENCRYPT_EMAIL=user@example.com
DOMAIN_NAME=example.com
```
### 🛠️ (optional) put your themes/plugins into the specific directory (Have to be compatible to the used wordpress version)
&nbsp;

### 🛠️ (optional) set php configuration at uploads.ini 
&nbsp;

### ⚠️ DOMAIN_NAME has to point to server IP to obtain SSL certificate 
&nbsp;
  
# 🔮 SETUP - let the magic happen
```
./setup.sh
```
&nbsp;

##  🧽 For complete uninstall (remove cronjob, containers, images, networks and volumes)
```
./uninstall.sh
```




## ⚠️ Visit your DOMAIN_NAME to finish the setup  

  &nbsp;&nbsp;
# Enjoy 👾