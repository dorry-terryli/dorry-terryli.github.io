#!/bin/bash

sudo apt install -y python3
sudo apt install -y python3-pip
sudo pip3 install pymongo
wget https://bitbucket.org/MatchboxDorry/dorry-installation/get/feature/release-script.tar.gz
mkdir ~/dorry-alpha/
mkdir ~/dorry-alpha/dorry-installation
echo 'export KUBECONFIG=$HOME/admin.conf' >> $HOME/.bashrc
source $HOME/.bashrc
tar -xvzf release-script.tar.gz -C ~/dorry-alpha/dorry-installation
python3 ~/dorry-alpha/dorry-installation/MatchboxDorry-dorry-installation-*/install_kubernetes.py
sudo python3 ~/dorry-alpha/dorry-installation/MatchboxDorry-dorry-installation-*/install_platform.py
sudo rm -r ~/dorry-alpha
