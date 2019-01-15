
# Procedure to install iCEcube on Ubuntu 18.04

[Ubuntu packages finder](https://packages.ubuntu.com)

## Install dependencies to software

Download and install libpng12:
```bash
wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_i386.deb
sudo dpkg -i libpng12*.deb
```

Install packages
```bash
sudo apt install libxext6:i386
sudo apt install zlib1g:i386
```

```bash
sudo apt install libsm6:i386

sudo apt install libxi6:i386

sudo apt install libxrender1:i386

sudo apt install libxrandr2:i386

sudo apt install libxfixes3:i386

sudo apt install libxcursor1:i386

sudo apt install libxinerama1:i386

sudo apt install libfreetype6:i386

sudo apt install libfontconfig1:i386

sudo apt install libglib2.0-0:i386

sudo apt install libstdc++6:i386
```
Then software can be installed

## Install license:
License must be generated for eth0 network card but ubuntu use now other names.
To see all available network interfaces type command: 
```bash
ip a
```
If eth0 not exist do this:

[Change interface name](https://askubuntu.com/questions/767786/changing-network-interfaces-name-ubuntu-16-04)

Edit your **/etc/default/grub** and change the line from
```
GRUB_CMDLINE_LINUX=""
```
to
```
GRUB_CMDLINE_LINUX="net.ifnames=0 biosdevname=0"
```

and then update grub as root:
```bash
sudo update-grub
```
and reboot your system

## DIAMOND PROGRAMMER 

To run programmer as normal user we have to add permissions.
First we need to create file:
```bash
sudo touch /etc/udev/rules.d/99-ftdi-for-user.rules 
```
with content:

```
SUBSYSTEM=="usb", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6010", MODE="0666", OWNER="1000"
```

Owner must be ID of user (can be checked using id command)

and reload rules:
```sh
sudo udevadm control --reload-rules
```


