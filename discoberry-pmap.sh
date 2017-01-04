#!/usr/bin/env bash

DBFROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

DBS="discoberry01.duckdns.org
     discoberry02.duckdns.org
     discoberry03.duckdns.org
     discoberry04.duckdns.org
     discoberry05.duckdns.org
     discoberry06.duckdns.org
     discoberry07.duckdns.org
     discoberry08.duckdns.org
     discoberry09.duckdns.org
     discoberry10.duckdns.org
"

pids=""

i=1
for db in $DBS; do
  log="$DBFROOT/tmp/$(date +%y%m%d-%H%M%S)-$db-$(printf "%02d" $i).log"
  echo ssh "pi@$db" "'$@'" > "$log"
  echo "------------" >> "$log"
  ssh "pi@$db" "$@" >> "$log" 2>&1 &
  pids="$pids $!"
  i=$(expr $i + 1)
done

i=1
for pid in $pids; do
  if wait $pid; then
    printf "%02d GOOD\n" $i
  else
    printf "%02d FAIL\n" $i
  fi
  i=$(expr $i + 1)
done
