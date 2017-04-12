#!/bin/bash

sudo apt-get install -y curl

echo 'export KUBECONFIG=$HOME/admin.conf' >> $HOME/.bashrc
source $HOME/.bashrc
echo $KUBECONFIG