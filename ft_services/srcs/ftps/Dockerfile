FROM alpine:3.11

VOLUME [ "/sys/fs/cgroup" ]

RUN apk add vsftpd

RUN apk add openssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem -subj "/C=MA/ST=BENG/L=BENG/O=LEET/CN=FTPS"

COPY srcs/vsftpd.conf /etc/vsftpd/

RUN echo "root:root" | chpasswd

RUN apk add openrc --no-cache

RUN openrc default
RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update

RUN apk add telegraf

RUN rc-update add telegraf

COPY srcs/telegraf.conf /etc/

COPY srcs/services.sh /

RUN chmod 777 services.sh
COPY srcs/status.sh /

RUN chmod 777 status.sh 
EXPOSE 21

ENTRYPOINT ["sh","services.sh"]

# apk add vsftpd
#  apk add openssl