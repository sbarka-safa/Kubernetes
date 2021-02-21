FROM alpine:3.11

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz

RUN tar -zxvf grafana-7.4.1.linux-amd64.tar.gz

RUN apk add openrc --no-cache

RUN openrc default

RUN apk add libc6-compat

COPY srcs/services.sh /

RUN chmod 777 services.sh 

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories

RUN apk update

RUN apk add telegraf

RUN rc-update add telegraf

COPY srcs/telegraf.conf /etc/

COPY srcs/grafana.db /grafana-7.4.1/data/
COPY srcs/status.sh /

EXPOSE 3000

ENTRYPOINT ["sh","services.sh"]
