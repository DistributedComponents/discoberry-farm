#!/usr/bin/env bash

DBR="$HOME/discoberry-farm"
LOG="$DBR/duckdns/duck.log"

D="$(hostname)"
T="$(cat "$DBR/DNSTOK")"
A="$($DBR/ip.sh)"

echo url="https://www.duckdns.org/update?domains=$D&token=$T&ip=$A&verbose=true" \
  | curl -k -o "$LOG" -K -
echo >> "$LOG"
date >> "$LOG"
