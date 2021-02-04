FROM alpine:3.11

RUN apk update

RUN apk add mariadb mariadb-common mariadb-client

RUN apk add openrc --no-cache

RUN openrc default

RUN rc-update add mariadb default

COPY srcs/services.sh /

COPY srcs/mariadb-server.cnf /etc/my.cnf.d/

COPY srcs/create_tables.sql /

COPY srcs/wordpress.sql /

COPY srcs/index.html /www/

RUN apk update

EXPOSE 3306

ENTRYPOINT ["sh","services.sh"]



