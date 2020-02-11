service mysql restart
mysql -u root -e "CREATE DATABASE wordpress;"
mysql -u root -e "CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';"
mysql -u root -e "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'localhost';"
mysql -u root -e "FLUSH PRIVILEGES;"
service nginx start && service php7.3-fpm start && service mysql restart
