#!/bin/sh

echo "##########"
echo "extract dokuwiki.tgz"
echo "##########"

if [ -f /var/www/html/index.php ] ; then
  echo "##########"
  echo "dokuwiki is already extracted"
  echo "##########"
else
  tar xvfz /tmp/dokuwiki.tgz -C /var/www/html --strip-components=1
  chown -R apache:apache /var/www/html
  rm -f /tmp/dokuwiki.tgz
fi

echo "##########"
echo "start apache"
echo "##########"
exec "$@"

