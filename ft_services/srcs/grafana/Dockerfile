FROM alpine:3.11

RUN wget https://dl.grafana.com/oss/release/grafana-7.4.1.linux-amd64.tar.gz

RUN tar -zxvf grafana-7.4.1.linux-amd64.tar.gz


RUN apk add libc6-compat

COPY srcs/services.sh /

EXPOSE 3000

ENTRYPOINT ["sh","services.sh"]
