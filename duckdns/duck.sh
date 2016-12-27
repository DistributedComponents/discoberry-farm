#!/usr/bin/env bash

DBR="$HOME/discoberry-farm"

D="$(cat "$DBR/DBFID")"
T="$(cat "$DBR/DNSTOK")"
A="$($DBR/ip.sh)"

echo url="https://www.duckdns.org/update?domains=$D&token=$T&ip=$A&verbose=true" \
  | curl -k -o "$DBR/duckdns/duck.log" -K -
