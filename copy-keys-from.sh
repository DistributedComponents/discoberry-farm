#!/usr/bin/env bash

REMOTE="$1:~/.ssh"

scp "$REMOTE/authorized_keys" \
    "$REMOTE/id_rsa" \
    "$REMOTE/id_rsa.pub" \
    ~/.ssh/
