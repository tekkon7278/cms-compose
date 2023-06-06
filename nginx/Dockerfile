FROM nginx
ARG SSL_DIR="/etc/nginx/ssl/tkng.site"
RUN apt update

COPY ./files/conf.d/ /etc/nginx/conf.d/

# create self signed certificate temporarily for ssl config before certbot
RUN mkdir -p ${SSL_DIR}
RUN openssl req -new -x509 -sha256 -newkey rsa:2048 -days 3 -nodes \
    -out ${SSL_DIR}/fullchain.pem \
    -keyout ${SSL_DIR}/privkey.pem \
    -subj "/CN=tkng.site/"
