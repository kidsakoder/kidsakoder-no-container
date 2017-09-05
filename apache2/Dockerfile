FROM enoniccloud/apache2

COPY var-www-html /var/www/html
COPY sites /etc/apache2/sites-enabled

RUN a2enmod proxy_wstunnel
RUN a2enmod proxy_http
RUN a2enmod rewrite

run rm /etc/apache2/sites-enabled/000-default.conf
run rm /etc/apache2/sites-enabled/default-ssl.conf
