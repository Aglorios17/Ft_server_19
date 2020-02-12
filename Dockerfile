# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aglorios <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/06 15:14:12 by aglorios          #+#    #+#              #
#    Updated: 2020/02/12 01:57:05 by aglorios         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

ENV NGINX_VERSION nginx:latest

RUN apt-get update -y \
&& apt update -y \
&& apt-get install gnupg -y \
&& apt-get install curl -y \
&& apt-get install wget -y \
&& apt-get install sudo -y

# install nginx

RUN apt-get install nginx -y

# install php

RUN apt-get install php -yq \
&& apt-get install php-mysql -yq \
&& apt install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -yq \
&& apt install php-json php-mbstring -y

#install mariadb

RUN apt install mariadb-server mariadb-client -yq

# install phpmyadmin

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpMyAdmin \
&& rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

#install SSL

RUN mkdir ./mkcert
COPY /srcs/mkcert ./mkcert/
RUN chmod +x ./mkcert/mkcert && ./mkcert/mkcert -install && ./mkcert/mkcert localhost.com

# install wordpress

RUN cd /tmp \
&& curl -O https://wordpress.org/latest.tar.gz \
&& tar xzvf latest.tar.gz \
&& cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php \
&& mkdir /var/www/html/wordpress \
&& sudo cp -a /tmp/wordpress/. /var/www/html/wordpress \
&& sudo chown -R www-data:www-data /var/www/
COPY srcs/wp-config.php /var/www/html/wordpress

#service start

RUN service nginx start
RUN service php7.3-fpm start
RUN service mysql start

#CONFIG html

COPY /srcs/nginx.conf /etc/nginx/sites-available
RUN rm /var/www/html/index.html 
RUN rm /var/www/html/index.nginx-debian.html 
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 80 443

COPY srcs/directoryindex.sh ./
COPY srcs/index.html ./
RUN /bin/bash ./directoryindex.sh
COPY srcs/sql_init.sh ./
CMD /bin/bash ./sql_init.sh && sleep infinity & wait
