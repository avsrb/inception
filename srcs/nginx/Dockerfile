FROM alpine:3.11.7

RUN apk update && apk upgrade
RUN apk add nginx
RUN apk add openssl libc6-compat

RUN openssl req -newkey rsa:2048 -x509 -sha256 -days 30 -nodes -out /etc/ssl/certs/certificate.crt -keyout /etc/ssl/certs/public.key -subj "/C=RU/ST=TATARSTAN/L=KAZAN/O=Security/OU=IT Department/CN=localhost"

COPY ./default /etc/nginx/conf.d/default.conf

RUN mkdir -p /run/nginx

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
