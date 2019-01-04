
# Procedure to install iCEcube on Ubuntu 18.04

[Ubuntu packages finder](https://packages.ubuntu.com)

## Install dependencies to software

Download and install libpng12:
```bash
wget https://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_i386.deb
sudo dpkg -i libpng12*.deb
```

Install packages
```bash
sudo apt install libxext6:i386
sudo apt install zlib1g:i386
```

```cpp
sudo apt install libsm6:i386

sudo apt install libxi6:i386

sudo apt install libxrender1:i386

sudo apt install libxrandr2:i386

sudo apt install libxfixes3:i386

sudo apt install libxcursor1:i386

sudo apt install libxinerama1:i386

sudo apt install libfreetype6:i386

sudo apt install libfontconfig1:i386

sudo apt install libglib-2.0-0:i386

sudo apt install libstdc++6:i386
```
Then software can be installed

## Install license:
License must be generated for eth0 device only.
type command: 
```
ip a
```
to see all available interfaces.
If eth0 not exist do this: 
https://askubuntu.com/questions/767786/changing-network-interfaces-name-ubuntu-16-04

Edit your /etc/default/grub changing the line from

GRUB_CMDLINE_LINUX=""

to

GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"

and, finally run as root:
```
sudo update-grub
```
and reboot your system

## DIAMOND PROGRAMMER Permissions
create file:
```sh
sudo touch /etc/udev/rules.d/70-ftdi-for-user.rules 
```
with content:

SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6010", MODE="0666", OWNER="1000"

and reload rules:
```sh
sudo udevadm control --reload-rules
```


