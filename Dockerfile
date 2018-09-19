FROM docker.io/centos:7.4.1708

RUN yum -y install httpd
COPY docker-entrypoint.sh /usr/bin/docker-entrypoint.sh
COPY httpd.conf /etc/httpd/conf/httpd.conf

EXPOSE 8080
ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["apachectl", "-DFOREGROUND"]

