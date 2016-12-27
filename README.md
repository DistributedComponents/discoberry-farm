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

1. Update apt and ensure system dependencies installed:
```
  $ sudo ./apt-update.sh
```
  You can continue with the following steps in parallel (until ssh setup).

1. Create a file `DBFID` with this machine's id (where `NN` is the number
   of this pi):
```
  $ echo "discoberryNN" > DBFID
```

1. Create a file `DNSTOK` with our Duck DNS token. This can be manually
   copied form another pi in the farm.

1. Make sure this pi is registered on [Duck DNS](https://www.duckdns.org/).

1. Install the crontab:
```
  $ crontab crontab
```

1. Set up ssh.  First start up `sshd`:
```
  $ sudo /etc/init.d/ssh start
```
Get the IP of this pi (DNS may not have updated yet):
```
  $ ./ip.sh
```
*From another pi in the farm*, do (where `IP` is the IP address of the pi
you are setting up):
```
  $ cd $HOME/discoberry-farm
  $ ./copy-keys.sh IP
```

1. TODO make sshd passwordless

1. TODO set timezone

1. TODO set hostname

1. Initialize opam then install Coq and opam dependencies:
```
  $ opam init
  $ eval `opam config env`
  $ ./opam-update.sh
```


