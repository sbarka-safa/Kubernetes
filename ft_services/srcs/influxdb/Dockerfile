FROM alpine:3.11

RUN apk update

RUN apk add --upgrade influxdb

RUN apk add openrc --no-cache

RUN openrc default

RUN rc-update add influxdb default

COPY srcs/services.sh /

EXPOSE 8086

ENTRYPOINT ["sh","services.sh"]