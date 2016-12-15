#!/usr/bin/env bash

# bail on first error
set -e

SENSOR_NET="$HOME/sensor-net"

mkdir -p "$SENSOR_NET"
pushd "$SENSOR_NET"
  if [ ! -d StructTact ]; then
    git clone 'https://github.com/uwplse/StructTact.git'
  fi
  pushd StructTact
    git pull
    ./build.sh
  popd

  if [ ! -d InfSeqExt ]; then
    git clone 'https://github.com/DistributedComponents/InfSeqExt.git'
  fi
  pushd InfSeqExt
    git pull
    ./build.sh
  popd

  if [ ! -d verdi ]; then
    git clone -b fair-shim-fds 'https://github.com/uwplse/verdi.git'
  fi
  pushd verdi
    git pull
    ./build.sh
  popd

  if [ ! -d AAC_tactics ]; then
    git clone -b v8.5 https://github.com/coq-contribs/aac-tactics.git AAC_tactics
  fi
  pushd AAC_tactics
    git pull
    make
  popd

  if [ ! -d verdi-aggregation ]; then
    git clone git@github.com:DistributedComponents/verdi-aggregation.git
  fi
  pushd verdi-aggregation
    git pull
    ./build.sh
  popd
popd
