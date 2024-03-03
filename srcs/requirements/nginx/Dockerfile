FROM debian:bullseye

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y nginx openssl \
    && rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/nginx_server.key -out /etc/ssl/certs/nginx_server.crt \
    -subj "/C=FR/L=Paris/O=42/CN=sperez-p.42.fr"

COPY ./conf/default /etc/nginx/sites-available/default
# Habilitar el archvo en sites enable?

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]