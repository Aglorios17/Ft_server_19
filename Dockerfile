# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aglorios <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/06 15:14:12 by aglorios          #+#    #+#              #
#    Updated: 2020/02/11 19:23:12 by aglorios         ###   ########.fr        #
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

# install mysql

#RUN apt install mysql-server


#install mariadb

RUN apt install mariadb-server mariadb-client -yq

# install phpmyadmin

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -zxvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages /var/www/html/phpMyAdmin \
&& rm phpMyAdmin-4.9.0.1-all-languages.tar.gz

#install SSL

RUN mkdir ./mkcert
COPY /src/mkcert ./mkcert/
RUN chmod +x ./mkcert/mkcert && ./mkcert/mkcert -install && ./mkcert/mkcert localhost.com


# install wordpress

RUN cd /tmp \
&& curl -O https://wordpress.org/latest.tar.gz \
&& tar xzvf latest.tar.gz \
&& cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php \
&& sudo cp -a /tmp/wordpress/. /var/www/html/ \
&& sudo chown -R www-data:www-data /var/www/
COPY src/wp-config.php /var/www/html

#service start

RUN service nginx start
RUN service php7.3-fpm start
RUN service mysql start

#CONFIG TEST

COPY /src/nginx.conf /etc/nginx/sites-available
COPY src/index.html /var/www/html
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
#RUN rm /var/www/html/index.html
#COPY src/index.html ./var/www/html/ 
#RUN mkdir -p /var/www
#COPY src/nginx.conf ./var/www/html/ 



EXPOSE 80 443

COPY src/sql_init.sh ./
CMD /bin/bash ./sql_init.sh && sleep infinity & wait
