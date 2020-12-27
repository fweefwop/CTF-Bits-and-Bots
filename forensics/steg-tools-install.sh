#!/bin/bash

set -e

echo "#############################################"
echo "########### fcrackzip #######################"
echo "#############################################"

sudo apt-get install fcrackzip


echo "#############################################"
echo "########### Exiftool #######################"
echo "#############################################"

sudo apt-get install exiftool

echo "#############################################"
echo "########### Steghide ########################"
echo "#############################################"

sudo apt-get install steghide

echo "#############################################"
echo "########### Outguess ########################"
echo "#############################################"

sudo apt-get install outguess

echo "#############################################"
echo "########### Jsteg    ########################"
echo "#############################################"

#download
sudo wget -O /usr/bin/jsteg https://github.com/lukechampine/jsteg/releases/download/v0.1.0/jsteg-linux-amd64
sudo chmod +x /usr/bin/jsteg

sudo wget -O /usr/bin/slink https://github.com/lukechampine/jsteg/releases/download/v0.2.0/slink-linux-amd64
sudo chmod +x /usr/bin/slink


echo "#############################################"
echo "########### Stegoveritas    #################"
echo "#############################################"

sudo pip3 install stegoveritas
sudo stegoveritas_install_deps


