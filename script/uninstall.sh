#!/bin/bash

wget https://bitbucket.org/MatchboxDorry/dorry-installation/get/feature/release-script.tar.gz
mkdir ~/dorry-alpha
mkdir ~/dorry-alpha/dorry-installation
tar -xvzf release-script.tar.gz -C ~/dorry-alpha/dorry-installation
python3 ~/dorry-alpha/dorry-installation/MatchboxDorry-dorry-installation-*/uninstall_kubernetes.py
python3 ~/dorry-alpha/dorry-installation/MatchboxDorry-dorry-installation-*/uninstall_platform.py
