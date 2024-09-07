#!/bin/sh

set -e

if [ ! -z "$TZ" ]
then
  cp /usr/share/zoneinfo/$TZ /etc/localtime
  echo $TZ > /etc/timezone
fi

/usr/sbin/backupninja --debug --now &

tail -F /var/log/backupninja.log