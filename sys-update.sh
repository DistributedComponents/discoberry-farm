#!/usr/bin/env bash

# bail on first error
set -e

SENSOR_NET="$HOME/sensor-net"

mkdir -p "$SENSOR_NET"
pushd "$SENSOR_NET"
	# TODO see if repos are already cloned, in which case just pull

  git clone 'https://github.com/uwplse/StructTact.git'
  pushd StructTact
    ./build.sh
  popd

  git clone 'https://github.com/DistributedComponents/InfSeqExt.git'
  pushd InfSeqExt
    ./build.sh
  popd

  git clone -b fair-shim-fds 'https://github.com/uwplse/verdi.git'
  pushd verdi
    ./build.sh
  popd

  git clone -b v8.5 https://github.com/coq-contribs/aac-tactics.git AAC_tactics
  pushd AAC_tactics
    make
  popd

  git clone git@github.com:DistributedComponents/verdi-aggregation.git
  pushd verdi-aggregation
    ./build.sh
  popd
popd
