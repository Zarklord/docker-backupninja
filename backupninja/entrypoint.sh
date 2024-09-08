#!/bin/sh

set -e

if [ ! -z "$TZ" ]
then
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  echo $TZ > /etc/timezone
fi

/usr/sbin/backupninja --now > /dev/null 2>&1 &

mkdir -p /var/log/backup

multitail --no-mergeall -I "/var/log/backupninja.log" -Iw "/var/log/backup/*" 10