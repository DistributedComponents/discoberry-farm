#!/usr/bin/env bash

# bail on first error
set -e

# TODO see if already on this switch
opam switch 4.02.2

eval `opam config env`
opam update
opam upgrade

# TODO check if already installed
opam repo add coq-released https://coq.inria.fr/opam/released
opam install coq.8.5.2
opam install coq-mathcomp-ssreflect.1.6
