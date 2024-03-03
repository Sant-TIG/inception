FROM debian:bullseye

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y curl \
    php7.4 php-mysql php-fpm netcat \
    && rm -rf /var/lib/apt/lists/*

COPY ./tools/wp.sh /wp.sh
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
#COPY ./conf/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf

RUN chmod +x /wp.sh \
    && mkdir -p /var/www/html \
    && mkdir /run/php \
    && chown -R root:root /var/www/html

EXPOSE 9000

CMD ["sh", "-c", "/wp.sh && php-fpm7.4 -F"]