FROM mysql
ARG MYSQL_ROOT_PASSWORD

#mysqldump output directory
RUN mkdir -p /srv/backup/data

# mysqldump execution shell and password option file
COPY ./files/dump.sh /srv/backup
COPY ./files/dump-extra.conf /srv/backup
RUN chmod 755 /srv/backup/dump.sh

# set password from environment arg
RUN sed -i s/password=/password=${MYSQL_ROOT_PASSWORD}/ /srv/backup/dump-extra.conf
