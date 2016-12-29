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

1. From `$HOME` clone [this repo](https://github.com/DistributedComponents/discoberry-farm)
   and change to its top-level directory:
   ```
     $ git clone https://github.com/DistributedComponents/discoberry-farm
     $ cd discoberry-farm
   ```

1. Update to latest release and install system dependencies:
   ```
     $ sudo ./apt-update.sh
     $ sudo reboot
   ```

1. Localize, enable ssh, and set hostname. Run:
   ```
     $ sudo raspi-config
   ```
   Under `Localization` set:
   * locale to `en_US.UTF-8 UTF-8` (make sure to *unset* the GB locale)
   * timezone to `America/Los_Angeles`
   * keyboard to US layout
   * wifi codes to US
   Under `Interfacing options` set:
   * ssh to enabled
   Under `Advanced options` set:
   * hostname to `discoberryNN` (where `NN` is the number of this pi)
   When you finish, accept the prompt to reboot.

1. Set up ssh.  Make sure ssh is running (and implicitly create `$HOME/.ssh`):
   ```
     $ ssh localhost
   ```
   Get the IP of this pi:
   ```
     $ $HOME/discoberry-farm/ip.sh
   ```
   *From another pi in the farm*, do (where `IP` is the IP address of the pi
   you are setting up):
   ```
     $ $HOME/discoberry-farm/copy-keys.sh IP
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

*At this point, the pi can be worked on remotely.*
