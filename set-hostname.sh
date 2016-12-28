#!/usr/bin/env bash

set -e

DBR="$HOME/discoberry-farm"
HOSTNAME="$(cat "$DBR/DBFID")"

sed -i "s/raspberrypi/$HOSTNAME/g" /etc/hosts
sed -i "s/raspberrypi/$HOSTNAME/g" /etc/hostname
/etc/init.d/hostname.sh start
/etc/init.d/networking force-reload
