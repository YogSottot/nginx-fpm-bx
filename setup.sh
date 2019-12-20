#!/usr/bin/env bash
set -e
# use
# bash <(curl -sL https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/setup.sh)

# wget http://www.1c-bitrix.ru/download/files/scripts/bitrix_server_test.php -P /home/bitrix/www/


# yum install php56-php-fpm php56-php-bcmath php56-php-cli php56-php-gd php56-php-mbstring php56-php-mcrypt php56-php-mysqlnd php56-php-opcache php56-php-pdo  php56-php-pecl-imagick php56-php-soap php56-php-xml php56

yum install php-fpm -y

# php-fpm additional settings
mkdir -p /etc/php-fpm.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/beta.conf -N -P /etc/php-fpm.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/default.conf -N -P /etc/php-fpm.d/

mkdir -p /etc/systemd/system/php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php-fpm.service.d/

systemctl daemon-reload

mkdir -p /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/bitrix_general.conf -N -P /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/bitrix.conf -N -P /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/errors.conf -N -P /etc/nginx/bx/conf_fpm/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/conf_fpm/fastcgi_params -N -P /etc/nginx/bx/conf_fpm/

wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/settings/fcgi.conf -N -P /etc/nginx/bx/settings/

mkdir -p /etc/nginx/bx/site_avaliable_fpm/
cp /etc/nginx/bx/site_avaliable/s* /etc/nginx/bx/site_avaliable_fpm/
cp /etc/nginx/bx/site_avaliable/bx* /etc/nginx/bx/site_avaliable_fpm/

find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i -r 's/set\ \$proxyserver(.*)/set\ \$php_sock\  unix\:\/var\/run\/php-fpm\/default\.socket\;/g'
find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i 's/proxy_pass\ \$proxyserver\;/error_page\ 404\ =\ \@bitrix\;\n\    log_not_found off\;/g'
find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i 's/proxy_ignore_client_abort/fastcgi_ignore_client_abort/g'
find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i 's/bx\/conf\/bitrix/bx\/conf_fpm\/bitrix/g'

bash <(curl -sL https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/session.sh)
#wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/site_avaliable/s1_simple.conf -N -O /etc/nginx/bx/site_avaliable_fpm/s1.conf
#wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/site_avaliable/ssl.s1_simple.conf -N -O /etc/nginx/bx/site_avaliable_fpm/ssl.s1.conf

nginx -t # && systemctl reload nginx
