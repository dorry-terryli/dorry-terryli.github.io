#!/bin/bash

echo 'export KUBECONFIG=$HOME/admin.conf' >> $HOME/.bashrc
source $HOME/.bashrc
echo $KUBECONFIG