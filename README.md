# Discoberry Farm

## Setting Up

1. Download Raspian Jessie with Pixel from
   [raspberrypi.org](https://www.raspberrypi.org/downloads/raspbian/)

1. Write the `.img` to a microSD card following
   [this guide](https://www.raspberrypi.org/documentation/installation/installing-images/README.md)

1. Put the microSD card in the pi; attach a monitor, keyboard, and mouse;
   then power it up.

1. **IMPORTANT** Set the password for the `pi` user (default is "raspberry"):
   ```
     $ passwd
   ```

1. Connect the pi's wifi to `CSE-Local`. Make sure to check the "Register
   Me Now" check box so that the department remembers this pi's MAC
   address.

1. Update to latest release:
   ```
     $ sudo apt-get update
     $ sudo apt-get upgrade
     $ sudo apt-get dist-upgrade
     $ sudo apt-get autoremove
     $ sudo reboot
   ```

1. Localize and enable ssh. Run:
   ```
     $ sudo raspi-config
   ```
   Under `Localization` set:
   * keyboard to US layout
   * timezone to `America/Los_Angeles`
   * locale to `en_US.UTF-8 UTF-8` (make sure to *unset* the GB locale)
   Under `Interfacing options` set:
   * ssh to enabled
   Under `Advanced options` set:
   * hostname to `discoberryNN` (where `NN` is the number of this pi)
   When you finish, accept the prompt to reboot.

1. From `$HOME` clone [this repo](https://github.com/DistributedComponents/discoberry-farm)
   and change to its top-level directory:
   ```
     $ git clone https://github.com/DistributedComponents/discoberry-farm
     $ cd discoberry-farm
   ```

1. Set up ssh.  First start up `sshd`:
   ```
     $ sudo /etc/init.d/ssh start
   ```
   Get the IP of this pi (DNS may not have updated yet) and create `~/.ssh/`:
   ```
     $ ./ip.sh
     $ mkdir -p ~/.ssh
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
   Finally, restart sshd so the changes take effect:
   ```
     $ sudo /etc/init.d/ssh restart
   ```

1. Copy `DNSTOK` from another pi in the farm:
   ```
     $ scp discoberryNN.duckdns.org:~/discoberry-farm/DNSTOK .
   ```
   If you're setting up any pi numbered 1 - 5, then `NN` should be in that range.
   If you're setting up any pi numbered 6 - 10, then `NN` should be in that range.
   Next, make sure this pi is registered on [Duck DNS](https://www.duckdns.org/).
   Finally, install the crontab:
   ```
     $ crontab crontab
   ```

1. *At this point, the pi can be worked on remotely.*

1. Update apt and ensure system dependencies installed:
   ```
     $ sudo ./apt-update.sh
   ```





--------------------------








1. Set the keyboard to US layout by running:
   ```
     $ sudo vim /etc/default/keyboard
   ```
   and changing `XKBLAYOUT="gb"` to `XKBLAYOUT="us"`

1. Set the timezone to `America/Los_Angeles` by navigating menus in:
   ```
     $ sudo dpkg-reconfigure tzdata
   ```

1. Set the locale to `en_US.UTF-8 UTF-8` and *unset* the GB locale by navigating menus in:
   ```
     $ sudo dpkg-reconfigure locales
   ```

1. Reboot with:
   ```
     $ sudo reboot
   ```

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

1. Set the hostname and reboot by runing:
   ```
     $ ./set-hostname.sh
     $ sudo reboot
   ```

1. Set up ssh.  First start up `sshd`:
   ```
     $ sudo /etc/init.d/ssh start
   ```
   Get the IP of this pi (DNS may not have updated yet) and create `~/.ssh/`:
   ```
     $ ./ip.sh
     $ mkdir -p ~/.ssh
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
