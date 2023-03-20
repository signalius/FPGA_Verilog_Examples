
# Procedure to install iCEcube on Ubuntu 18.04

[Ubuntu packages finder](https://packages.ubuntu.com)

## Install dependencies to software

Download and install libpng12:
```bash
wget http://security.ubuntu.com/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_i386.deb
Unpack files libpng12.so.0.54.0 and libpng12.so.0 to /lib/i386-linux-gnu/
```

Then software can be installed

## Install license:
License must be generated for eth0 network card.
To see all available network interfaces type command: 
```bash
ip a
```
Take the MAC number from the eth0 interface and enter it on the lattice page to generate a license. 
A license.dat file will be sent to your email address, which you should save to disk. 
Then run LicenseSetup and point to this file. 




