FROM    ajoergensen/baseimage-ubuntu

LABEL	maintainer="Rizal Fauzie Ridwan <rizal@fauzie.my.id>"

ENV     PHP_VERSION=7.2 \
        VIRTUAL_HOST=$DOCKER_HOST \
        PHP_VHOST=whms.local \
        HOME=/var/www/whmcs \
        TZ=Europe/London \
        WHMCS_SERVER_IP=172.17.0.1 \
        REAL_IP_FROM=172.17.0.0/16 \
        REAL_IP_HEADER=X-Forwarded-For \
        SSH_PORT=2222

COPY    build /build

RUN     bash /build/setup.sh && rm -rf /build

COPY    root/ /

RUN     chmod -v +x /etc/my_init.d/*.sh /etc/service/*/run

EXPOSE  2222

VOLUME  /var/www/whmcs
WORKDIR /var/www/whmcs
