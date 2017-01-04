#!/usr/bin/env bash

TARGET="$1:~/.ssh/"

scp ~/.ssh/authorized_keys \
    ~/.ssh/id_rsa \
    ~/.ssh/id_rsa.pub \
  "$TARGET"
