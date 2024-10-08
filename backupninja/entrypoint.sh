#!/bin/sh

set -e

if [ ! -z "$TZ" ]
then
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  echo $TZ > /etc/timezone
fi

/usr/sbin/backupninja --now > /dev/null 2>&1 &

/etc/init.d/cron start

mkdir -p /var/log/backup

xtail /var/log/backupninja.log /var/log/backup