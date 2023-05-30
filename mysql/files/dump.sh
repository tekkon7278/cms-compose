#!/bin/sh

mysqldump --defaults-extra-file=/srv/backup/dump-extra.conf -uroot -A -n > /srv/backup/data/cms-`date +%d`.sql
