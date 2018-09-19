#!/bin/sh

mkdir -p /var/log/httpd
chown -R apache:apache /var/log/httpd

echo $GREETING > /var/www/html/index.html

echo "##########"
echo "start apache"
echo "##########"
exec "$@"

