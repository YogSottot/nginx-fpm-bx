#!/usr/bin/env bash
set -e
# use
# bash <(curl -sL https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/setup.sh)

# wget http://www.1c-bitrix.ru/download/files/scripts/bitrix_server_test.php -P /home/bitrix/www/


# yum install php56-php-fpm php56-php-bcmath php56-php-cli php56-php-gd php56-php-mbstring php56-php-mcrypt php56-php-mysqlnd php56-php-opcache php56-php-pdo  php56-php-pecl-imagick php56-php-soap php56-php-xml php56 php56-php-pecl-geoip php56-php-ldap php56-php-pecl-memcache php56-php-pecl-apcu php56-php-pecl-rrd php56-php-pecl-libsodium php56-php-pspell

# yum install php70-php-fpm php70-php-bcmath php70-php-cli php70-php-gd php70-php-mbstring php70-php-mcrypt php70-php-mysqlnd php70-php-opcache php70-php-pdo  php70-php-pecl-imagick php70-php-soap php70-php-xml php70 php70-php-pecl-geoip php70-php-ldap php70-php-pecl-memcache php70-php-pecl-apcu php70-php-pecl-rrd php70-php-sodium php70-php-pspell

# yum install php71-php-fpm php71-php-bcmath php71-php-cli php71-php-gd php71-php-mbstring php71-php-mcrypt php71-php-mysqlnd php71-php-opcache php71-php-pdo  php71-php-pecl-imagick php71-php-soap php71-php-xml php71 php71-php-pecl-geoip php71-php-ldap php71-php-pecl-memcache php71-php-pecl-apcu php71-php-pecl-rrd php71-php-sodium php71-php-pspell

# yum install php72-php-fpm php72-php-bcmath php72-php-cli php72-php-gd php72-php-mbstring php72-php-mcrypt php72-php-mysqlnd php72-php-opcache php72-php-pdo  php72-php-pecl-imagick php72-php-soap php72-php-xml php72 php72-php-pecl-geoip php72-php-ldap php72-php-pecl-memcache php72-php-pecl-apcu php72-php-pecl-rrd php72-php-sodium php72-php-pspell

# yum install php73-php-fpm php73-php-bcmath php73-php-cli php73-php-gd php73-php-mbstring php73-php-mcrypt php73-php-mysqlnd php73-php-opcache php73-php-pdo  php73-php-pecl-imagick php73-php-soap php73-php-xml php73 php73-php-pecl-geoip php73-php-ldap php73-php-pecl-memcache php73-php-pecl-apcu php73-php-pecl-rrd php73-php-sodium php73-php-pspell

# yum install php74-php-fpm php74-php-bcmath php74-php-cli php74-php-gd php74-php-mbstring php74-php-mcrypt php74-php-mysqlnd php74-php-opcache php74-php-pdo  php74-php-pecl-imagick php74-php-soap php74-php-xml php74 php74-php-pecl-geoip php74-php-ldap php74-php-pecl-memcache php74-php-pecl-apcu php74-php-pecl-rrd php74-php-sodium php74-php-pspell

# yum install php80-php-fpm php80-php-bcmath php80-php-cli php80-php-gd php80-php-mbstring php80-php-mcrypt php80-php-mysqlnd php80-php-opcache php80-php-pdo  php80-php-pecl-imagick php80-php-soap php80-php-xml php80 php80-php-pecl-geoip php80-php-ldap php80-php-pecl-memcache php80-php-pecl-apcu php80-php-pecl-rrd php80-php-sodium php80-php-pspell

yum install php-fpm -y

# php-fpm additional settings
mkdir -p /etc/php-fpm.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/beta.conf -N -P /etc/php-fpm.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/default.conf -N -P /etc/php-fpm.d/

mkdir -p /etc/systemd/system/php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php-fpm.service.d/

mkdir -p /etc/systemd/system/php56-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php56-php-fpm.service.d/

mkdir -p /etc/systemd/system/php70-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php70-php-fpm.service.d/

mkdir -p /etc/systemd/system/php71-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php71-php-fpm.service.d/

mkdir -p /etc/systemd/system/php72-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php72-php-fpm.service.d/

mkdir -p /etc/systemd/system/php73-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php73-php-fpm.service.d/

mkdir -p /etc/systemd/system/php74-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php74-php-fpm.service.d/

mkdir -p /etc/systemd/system/php80-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php80-php-fpm.service.d/

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

# cp /etc/php-fpm.d/74.conf /etc/opt/remi/php56/php-fpm.d/56.conf
# cp /etc/php-fpm.d/74.conf /etc/opt/remi/php70/php-fpm.d/70.conf
# cp /etc/php-fpm.d/74.conf /etc/opt/remi/php71/php-fpm.d/71.conf
# cp /etc/php-fpm.d/74.conf /etc/opt/remi/php72/php-fpm.d/72.conf
# cp /etc/php-fpm.d/74.conf /etc/opt/remi/php73/php-fpm.d/73.conf
# cp /etc/php-fpm.d/74.conf /etc/opt/remi/php80/php-fpm.d/80.conf

# cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php56/php.d/
# cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php70/php.d/
# cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php71/php.d/
# cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php72/php.d/
# cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php73/php.d/
# cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php74/php.d/
# cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php80/php.d/

# cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php56/php.d/
# cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php70/php.d/
# cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php71/php.d/
# cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php72/php.d/
# cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php73/php.d/
# cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php74/php.d/
# cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php80/php.d/

# find /etc/opt/remi/php56/php-fpm.d/56.conf -type f -print0 | xargs -0 sed -i -r 's/php74/php56/g'
# find /etc/opt/remi/php70/php-fpm.d/70.conf -type f -print0 | xargs -0 sed -i -r 's/php74/php70/g'
# find /etc/opt/remi/php71/php-fpm.d/71.conf -type f -print0 | xargs -0 sed -i -r 's/php74/php71/g'
# find /etc/opt/remi/php72/php-fpm.d/72.conf -type f -print0 | xargs -0 sed -i -r 's/php74/php72/g'
# find /etc/opt/remi/php73/php-fpm.d/73.conf -type f -print0 | xargs -0 sed -i -r 's/php74/php73/g'
# find /etc/opt/remi/php80/php-fpm.d/80.conf -type f -print0 | xargs -0 sed -i -r 's/php74/php80/g'
