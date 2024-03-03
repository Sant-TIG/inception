FROM debian:bullseye

RUN apt-get update -y \
    && apt-get upgrade -y \
    && apt-get install -y mariadb-server \
    && rm -rf /var/lib/apt/lists/*

COPY tools/db.sh /db.sh
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x db.sh && mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld

EXPOSE 3306

CMD ["sh", "-c", "/db.sh > /home/db.sql && mysqld --init-file=/home/db.sql"]