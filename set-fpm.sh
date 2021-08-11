#!/usr/bin/env bash

domain=$1
php_version=$2

if [ -z ${domain} ]; then
	echo Usage: $0 domain php_version. Example: $0 domain.tld 56
	exit
fi

if [ -z ${php_version} ]; then
	echo Usage: $0 Available versions php: 56, 70, 71, 72, 73, 74, 80
	exit
fi

cp /etc/nginx/bx/site_avaliable/bx_ext_${domain}.conf /etc/nginx/bx/site_avaliable_fpm/
cp /etc/nginx/bx/site_avaliable/bx_ext_ssl_${domain}.conf /etc/nginx/bx/site_avaliable_fpm/


find /etc/nginx/bx/site_avaliable_fpm/bx_ext_${domain}.conf  -type f -print0 | xargs -0 sed -i -r 's/set\ \$proxyserver(.*)/set\ \$php_sock\  unix\:\/var\/run\/php'${php_version}'\.socket\;/g'
find /etc/nginx/bx/site_avaliable_fpm/bx_ext_${domain}.conf  -type f -print0 | xargs -0 sed -i 's/proxy_pass\ \$proxyserver\;/error_page\ 404\ =\ \@bitrix\;\n\    log_not_found off\;/g'
find /etc/nginx/bx/site_avaliable_fpm/bx_ext_${domain}.conf  -type f -print0 | xargs -0 sed -i 's/proxy_ignore_client_abort/fastcgi_ignore_client_abort/g'
find /etc/nginx/bx/site_avaliable_fpm/bx_ext_${domain}.conf  -type f -print0 | xargs -0 sed -i 's/bx\/conf\/bitrix/bx\/conf_fpm\/bitrix/g'

find /etc/nginx/bx/site_avaliable_fpm/bx_ext_ssl_${domain}.conf  -type f -print0 | xargs -0 sed -i -r 's/set\ \$proxyserver(.*)/set\ \$php_sock\  unix\:\/var\/run\/php'${php_version}'\.socket\;/g'
find /etc/nginx/bx/site_avaliable_fpm/bx_ext_ssl_${domain}.conf  -type f -print0 | xargs -0 sed -i 's/proxy_pass\ \$proxyserver\;/error_page\ 404\ =\ \@bitrix\;\n\    log_not_found off\;/g'
find /etc/nginx/bx/site_avaliable_fpm/bx_ext_ssl_${domain}.conf  -type f -print0 | xargs -0 sed -i 's/proxy_ignore_client_abort/fastcgi_ignore_client_abort/g'
find /etc/nginx/bx/site_avaliable_fpm/bx_ext_ssl_${domain}.conf  -type f -print0 | xargs -0 sed -i 's/bx\/conf\/bitrix/bx\/conf_fpm\/bitrix/g'

pushd /etc/nginx/bx/site_enabled
ln -sf ../site_avaliable_fpm/bx_ext_${domain}.conf .
ln -sf ../site_avaliable_fpm/bx_ext_ssl_${domain}.conf .
popd

nginx -t && systemctl reload nginx
