echo "
-- Creacion de la base de datos
CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};

-- Creacion del administrador de la base de datos
CREATE USER IF NOT EXISTS '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_ROOT_USER}'@'localhost' WITH GRANT OPTION;

-- Creacion del usuario normal de la base de datos
CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';
GRANT SELECT, INSERT, UPDATE, DELETE ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';

ALTER USER "root"@"localhost" IDENTIFIED BY "root";

-- Hacer que los privilegios se efectuen de inmediato
FLUSH PRIVILEGES;"

# Igual el problema es que el usuario tiene permisos limitados