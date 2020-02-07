# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: aglorios <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/02/06 15:14:12 by aglorios          #+#    #+#              #
#    Updated: 2020/02/07 16:10:42 by aglorios         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

MAINTAINER Alessio Glorioso <aglorios@student.s19.be>

ENV NGINX_VERSION nginx:latest

RUN apt-get update -y \
&& apt update -y \
&& apt-get install gnupg -y \
&& apt-get install sudo -y

RUN apt-get install nginx -y \
&& service nginx start

# install php

RUN apt-get install php -yq \
&& apt-get install php-mysql -yq \
&& apt install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline -yq \
&& apt install php-json php-mbstring -y

# install wordpress

RUN apt-get install wordpress -yq
#RUN service wordpress start

#install mariadb

RUN apt install mariadb-server mariadb-client -yq

# install phpmyadmin

#CONFIG TEST

RUN rm /var/www/html/index.html
COPY src/index.html ./var/www/html/ 

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
