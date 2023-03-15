#!/usr/bin/env bash
set -xeuo pipefail
# use
# curl -sL https://raw.githubusercontent.com/YogSottot/useful_scripts/master/bitrix/auto_setup.sh | bash -s -- php_ver (56 — 81)

# wget http://www.1c-bitrix.ru/download/files/scripts/bitrix_server_test.php -P /home/bitrix/www/

php_ver=$1

if [ php_ver == 56 ]; then
	yum install -y php56-php-fpm php56-php-bcmath php56-php-cli php56-php-gd php56-php-mbstring php56-php-mcrypt php56-php-mysqlnd php56-php-opcache php56-php-pdo  php56-php-pecl-imagick php56-php-soap php56-php-xml php56 php56-php-pecl-geoip php56-php-ldap php56-php-pecl-memcache php56-php-pecl-apcu php56-php-pecl-rrd php56-php-pecl-libsodium php56-php-pspell php56-php-pecl-zip
else
	yum install -y php"${php_ver}"-php-fpm php"${php_ver}"-php-bcmath php"${php_ver}"-php-cli php"${php_ver}"-php-gd php"${php_ver}"-php-mbstring php"${php_ver}"-php-mcrypt php"${php_ver}"-php-mysqlnd php"${php_ver}"-php-opcache php"${php_ver}"-php-pdo  php"${php_ver}"-php-pecl-imagick php"${php_ver}"-php-soap php"${php_ver}"-php-xml php"${php_ver}" php"${php_ver}"-php-pecl-geoip php"${php_ver}"-php-ldap php"${php_ver}"-php-pecl-memcache php"${php_ver}"-php-pecl-apcu php"${php_ver}"-php-pecl-rrd php"${php_ver}"-php-sodium php"${php_ver}"-php-pspell php"${php_ver}"-php-pecl-zip php"${php_ver}"-php-intl php"${php_ver}"-php-process
fi

yum install php-fpm -y

# php-fpm additional settings
mkdir -p /etc/php-fpm.d/
#wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/beta.conf -N -P /etc/php-fpm.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/php-fpm.d/74.conf -N -P /etc/php-fpm.d/

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

mkdir -p /etc/systemd/system/php81-php-fpm.service.d/
wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/others/etc/systemd/system/php-fpm.service.d/override.conf -N -P /etc/systemd/system/php81-php-fpm.service.d/

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

find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i -r 's/set\ \$proxyserver(.*)/set\ \$php_sock\  unix\:\/var\/run\/php74.socket\;/g'
find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i 's/proxy_pass\ \$proxyserver\;/error_page\ 404\ =\ \@bitrix\;\n\    log_not_found off\;/g'
find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i 's/proxy_ignore_client_abort/fastcgi_ignore_client_abort/g'
find /etc/nginx/bx/site_avaliable_fpm/ -type f -print0 | xargs -0 sed -i 's/bx\/conf\/bitrix/bx\/conf_fpm\/bitrix/g'

wget  https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/set-fpm.sh -N -P /etc/nginx/bx/
chmod +x /etc/nginx/bx/set-fpm.sh

bash <(curl -sL https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/session.sh)
#wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/site_avaliable/s1_simple.conf -N -O /etc/nginx/bx/site_avaliable_fpm/s1.conf
#wget https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/bx/site_avaliable/ssl.s1_simple.conf -N -O /etc/nginx/bx/site_avaliable_fpm/ssl.s1.conf

nginx -t # && systemctl reload nginx

cp /etc/php-fpm.d/74.conf /etc/opt/remi/php"${php_ver}"/php-fpm.d/"${php_ver}".conf

cp /etc/php.d/bitrixenv.ini /etc/opt/remi/php"${php_ver}"/php.d/

cp /etc/php.d/z_bx_custom.ini /etc/opt/remi/php"${php_ver}"/php.d/

cp /etc/php.d/10-opcache.ini /etc/opt/remi/php"${php_ver}"/php.d/ -f

find /etc/opt/remi/php"${php_ver}"/php-fpm.d/"${php_ver}".conf -type f -print0 | xargs -0 sed -i -r 's/php74/php'${php_ver}'/g'

truncate -s 0 /etc/php-fpm.d/www.conf
truncate -s 0 /etc/opt/remi/php"${php_ver}"/php-fpm.d/www.conf
