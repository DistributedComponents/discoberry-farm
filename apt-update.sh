apt-get -y update
apt-get -y upgrade
apt-get -y dist-upgrade
apt-get -y autoremove
apt-get -y install \
  vim curl openssh-server lsof screen mosh tmux \
  m4 mercurial darcs build-essential opam
