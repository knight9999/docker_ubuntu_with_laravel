#!/bin/bash

if [ ! -e /var/db/mysql ]; then
  mkdir -p /var/db/mysql
fi
chmod a+w /var/db/mysql

cp -rpn /var/lib/mysql/* /var/db/mysql/

mkdir -p /mnt/etc
chmod a+w /mnt/etc

cp -rpf /mnt/etc/* /etc/

service rsyslog start
service apache2 start
service mysql start
service postfix start

if [ ! -e /started ]; then
  mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'debian-sys-maint'@'localhost' IDENTIFIED BY 'asdjklsd1xja' WITH GRANT OPTION;"
fi

touch /started

trap_TERM() {
  echo 'SIGTERM ACCEPTED.'
  service apache2 stop
  service mysql stop
  service postfix stop
  service rsyslog stop
  exit 0
}
trap 'trap_TERM' TERM

while :
do
  sleep 5
done
