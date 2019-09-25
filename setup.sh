#!/usr/bin/env bash
set -e
# use
# bash <(curl -sL https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/setup.sh)

# wget http://www.1c-bitrix.ru/download/files/scripts/bitrix_server_test.php -P /home/bitrix/www/




# php-fpm additional settings
mkdir -p /etc/php-fpm.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/beta.conf -N -P /etc/php-fpm.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/default.conf -N -P /etc/php-fpm.d/

mkdir -p /etc/systemd/system/php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf-N -P /etc/systemd/system/php-fpm.service.d/

systemctl daemon-reload

mkdir -p /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/bitrix_general.conf -N -P /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/bitrix.conf -N -P /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/errors.conf -N -P /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/fastcgi_params -N -P /etc/nginx/bx/conf_fpm/

wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/settings/fcgi.conf -N -P /etc/nginx/bx/settings/

mkdir -p /etc/nginx/bx/site_avaliable_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/site_avaliable/s1_simple.conf -N -O /etc/nginx/bx/site_avaliable_fpm/s1.conf
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/site_avaliable/ssl.s1_simple.conf -N -O /etc/nginx/bx/site_avaliable_fpm/ssl.s1.conf

nginx -t # && systemctl reload nginx
