# Discoberry Farm

## Setting Up

1. Download Raspian Jessie with Pixel from
   [raspberrypi.org](https://www.raspberrypi.org/downloads/raspbian/).

1. Write the `.img` to a microSD card following
   [this guide](https://www.raspberrypi.org/documentation/installation/installing-images/README.md).

1. Put the microSD card in the pi; attach a monitor, keyboard, and mouse;
   then power it up.

1. IMPORTANT: set the password for the `pi` user (default is "raspberry"):
```
  $ passwd
```

1. Set up the pi's wifi connection to `CSE-Local`. Make sure to check the
   "Register Me Now" check box so that the department remembers this pi's
   MAC address.

1. From `$HOME` clone [this repo](https://github.com/DistributedComponents/discoberry-farm)
   and change to its top-level directory:
```
  $ git clone https://github.com/DistributedComponents/discoberry-farm
  $ cd discoberry-farm
```

1. Create a file `DBFID` with this machine's id (where `NN` is the number
   of this pi):
```
  $ echo "discoberryNN" > DBFID
```

1. Create a file `DNSTOK` with our DuckDNS token. This can be manually
   copied form another pi in the farm.

1. Update apt and ensure system dependencies installed:
```
  $ sudo ./apt-update.sh
```

1. TODO set up DNS

1. From another pi in the farm, do:
```
  $ cd discoberry-farm
  $ copy keys NN
```

1. TODO copy keys

1. TODO make sshd passwordless

1. TODO set timezone

1. TODO set hostname

1. Initialize opam then install Coq and opam dependencies:
```
  $ opam init
  $ eval `opam config env`
  $ ./opam-update.sh
```


