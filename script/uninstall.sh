#!/bin/bash

wget https://bitbucket.org/MatchboxDorry/dorry-installation/get/feature/release-script.tar.gz
mkdir ~/dorry
mkdir ~/dorry/dorry-installation
tar -xvzf release-script.tar.gz -C /opt/dorry-installation
python3 ~/dorry/dorry-installation/MatchboxDorry-dorry-installation-*/uninstall_kubernetes.py
python3 ~/dorry/dorry-installation/MatchboxDorry-dorry-installation-*/uninstall_platform.py
