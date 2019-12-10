#!/usr/bin/env bash
set -e
# use
# bash <(curl -sL https://raw.githubusercontent.com/YogSottot/nginx-fpm-bx/master/session.sh)

for dir in $(find /tmp/php_sessions/ext_www/ -maxdepth 1 -type d -print0 | xargs --null -L1 -I{} basename "{}")
do
echo -e "[PATH=/home/bitrix/ext_www/${dir}]\nsession.save_path=/tmp/php_sessions/ext_www/${dir}\nupload_tmp_dir=/tmp/php_upload/ext_www/${dir}\n" >> /etc/php.d/z_bx_custom.ini
done
