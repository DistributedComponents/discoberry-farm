#!/usr/bin/env bash

DBR="$HOME/discoberry-farm"

D="$(cat "$DBR/DBFID")"
T="$(cat "$DBR/DNSTOK")"

echo url="https://www.duckdns.org/update?domains=$D&token=$T&ip=" \
  | curl -k -o "$DBR/duckdns/duck.log" -K -
