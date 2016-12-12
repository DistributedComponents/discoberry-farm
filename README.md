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

1. Clone [this repo](https://github.com/DistributedComponents/discoberry-farm):
```
  $ git clone https://github.com/DistributedComponents/discoberry-farm
```

1. `cd` into the repo and run `apt-update.sh`:
```
  $ cd discoberry-farm
  $ sudo ./apt-update.sh
```

1. TODO set up Coq

1. TODO set up Verdi

1. TODO set up DNS

1. TODO copy keys

1. TODO make sshd passwordless

1. TODO set timezone

1. TODO set hostname
