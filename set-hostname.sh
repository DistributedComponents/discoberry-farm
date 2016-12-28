#!/usr/bin/env bash

set -e

DBR="$HOME/discoberry-farm"
HOSTNAME="$(cat "$DBR/DBFID")"

sudo sed -i "s/raspberrypi/$HOSTNAME/g" /etc/hosts
sudo sed -i "s/raspberrypi/$HOSTNAME/g" /etc/hostname
sudo /etc/init.d/hostname.sh start
sudo /etc/init.d/networking force-reload
