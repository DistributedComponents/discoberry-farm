#!/usr/bin/env bash

ifconfig wlan0 | grep 'inet ' | awk '{print $2}' | cut -d ':' -f 2
