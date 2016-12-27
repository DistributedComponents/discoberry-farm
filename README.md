# Discoberry Farm

## Setting Up

1. Download Raspian Jessie with Pixel from
   [raspberrypi.org](https://www.raspberrypi.org/downloads/raspbian/)

1. Write the `.img` to a microSD card following
   [this guide](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

1. Put the microSD card in the pi; attach a monitor, keyboard, and mouse;
   then power it up.

1. IMPORTANT: set the password for the `pi` user (default is "raspberry",
   if you do not know the discoberry-farm password, ask Zach):
   ```
     $ passwd
   ```

1. Set up the pi's wifi connection to `CSE-Local`. Make sure to check the
   "Register Me Now" check box so that the department remembers this pi's
   MAC address.

1. Ensure basic utilities needed in the next few steps are installed:
```
  $ sudo apt-get install vim git curl openssh-server
```

1. From `$HOME` clone [this repo](https://github.com/DistributedComponents/discoberry-farm)
   and change to its top-level directory:
```
  $ git clone https://github.com/DistributedComponents/discoberry-farm
  $ cd discoberry-farm
```

1. Set up DNS. Create a file `DBFID` with this machine's id (where `NN` is
   the number of this pi):
```
  $ echo "discoberryNN" > DBFID
```
   Create a file `DNSTOK` with our Duck DNS token. This can be manually
   copied form another pi in the farm. Next, make sure this pi is
   registered on [Duck DNS](https://www.duckdns.org/). Finally, install
   the crontab:
```
  $ crontab crontab
```

1. Set the hostname. Run:
```
  $ sudo vim /etc/hosts
```
  and change the *last line* to (where NN is the number of this pi):
```
    127.0.1.1       discoberryNN
```
  Next, run:
```
  $ sudo vim /etc/hostname
```
  and change the *only line* to (where NN is the number of this pi):
```
    discoberryNN
```
  Finally, poke the hostname and networking services so the changes take effect:
```
	$ sudo /etc/init.d/hostname.sh start
	$ sudo /etc/init.d/networking force-reload
```

1. Set the timezone to `America/Los_Angeles` by navigating menus in:
```
  $ sudo dpkg-reconfigure tzdata
```

1. Set the locale to `en_US.UTF-8 UTF-8` and *unset* the GB locale by navigating menus in:
```
  $ sudo dpkg-reconfigure locales
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
  Now to make sshd passwordless, run:
```
  $ sudo vim /etc/ssh/sshd_config
```
  and make sure these lines are set as follows:
```
    PermitRootLogin no
    PermitEmptyPasswords no
    ChallengeResponseAuthentication no
    PasswordAuthentication no
    UsePAM no
```
  Set sshd to start on boot (under `Interfacing options`):
```
  $ sudo raspi-config
```
  Finally, restart sshd so the changes take effect:
```
	$ sudo /etc/init.d/ssh restart
```

1. Reboot the pi and make sure everything comes back up correctly:
```
  $ sudo reboot
```

1. *At this point, the pi can be worked on remotely.*

1. Update apt and ensure system dependencies installed:
```
  $ sudo ./apt-update.sh
```
