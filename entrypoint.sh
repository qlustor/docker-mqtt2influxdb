#!/bin/sh

printenv >> /etc/environment
ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install mqtt2influx.yml
if [ ! -e /etc/hardwario/mqtt2influxdb.yml ]
then
  mkdir -p /etc/hardwario
  cp /app/mqtt2influxdb.yml /etc/hardwario/mqtt2influxdb.yml
fi

exec /usr/local/bin/python3 `which mqtt2influxdb` $@
