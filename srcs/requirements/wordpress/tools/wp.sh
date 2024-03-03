while ! nc -z mariadb_container 3306; do
  echo "Esperando a que el contenedor 'db' esté disponible..."
  sleep 2
done

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --alow-root --path=/var/www/html
cd /var/www/html
wp config create --allow-root --dbname=${MYSQL_DATABASE} --dbuser=${MYSQL_USER} --dbpass=${MYSQL_USER_PASSWORD} --dbhost=${MYSQL_HOST} #--locale=es_ES --skip-check
wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} --admin_user=${MYSQL_ROOT_USER} --admin_password=${MYSQL_ROOT_PASSWORD} --admin_email=${WP_ADMIN_EMAIL}  --skip-email
wp user create --alow-root ${WP_USER} ${WP_EMAIL} --role=author --user_pass=${WP_PWD}
wp theme install astra --allow-root --activate --allow-root