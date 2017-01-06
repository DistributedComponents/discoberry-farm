opam init --yes
eval $(opam config env)
opam switch 4.02.3
eval $(opam config env)
opam repo add coq-released https://coq.inria.fr/opam/released
opam install coq.8.5.3 coq-mathcomp-ssreflect.1.6 coq-mathcomp-fingroup.1.6 coq-mathcomp-algebra.1.6 coq-aac-tactics.8.5.1 ounit.2.0.0 uuidm.0.9.6 portaudio.0.2.1 --yes
