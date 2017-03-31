#!/bin/bash

wget https://bitbucket.org/MatchboxDorry/dorry-installation/get/master.tar.gz
mkdir /opt/dorry-installation
tar -xvzf master.tar.gz -C /opt/dorry-installation
python3 /opt/dorry-installation/MatchboxDorry-dorry-installation-*/uninstall_kubernetes.py
python3 /opt/dorry-installation/MatchboxDorry-dorry-installation-*/uninstall_platform.py
