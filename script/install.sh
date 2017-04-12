#!/bin/bash

set -e
sudo apt install -y python3
echo $?
sudo apt install -y python3-pip
echo $?
sudo pip3 install pymongo
echo $?
wget https://bitbucket.org/MatchboxDorry/dorry-installation/get/feature/release-script.tar.gz
mkdir ~/dorry-alpha/
mkdir ~/dorry-alpha/dorry-installation

tar -xvzf release-script.tar.gz -C ~/dorry-alpha/dorry-installation
# python3 ~/dorry-alpha/dorry-installation/MatchboxDorry-dorry-installation-*/install_kubernetes.py

sudo apt-get install -y curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
#sudo echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
sudo echo 'deb http://apt.kubernetes.io/ kubernetes-xenial main' | sudo tee --append /etc/apt/sources.list.d/kubernetes.list > /dev/null
sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl kubernetes-cni --allow-unauthenticated

# # Initialize Kubernetes
sudo kubeadm reset
sudo kubeadm init

sudo cp /etc/kubernetes/admin.conf $HOME/
echo $USER
sudo chown $USER:$USER $HOME/admin.conf
echo 'export KUBECONFIG=$HOME/admin.conf' >> $HOME/.bashrc
source $HOME/.bashrc
echo $KUBECONFIG

kubectl taint nodes --all node-role.kubernetes.io/master-
kubectl apply -f http://docs.projectcalico.org/v2.1/getting-started/kubernetes/installation/hosted/kubeadm/1.6/calico.yaml
kubectl create namespace dorry-system

#sed -i 's/--insecure-bind-address=127.0.0.1/--insecure-bind-address=0.0.0.0/g' /etc/kubernetes/manifests/kube-apiserver.json
sudo sed -i 's/--insecure-port=0/--insecure-port=8080/g' /etc/kubernetes/manifests/kube-apiserver.yaml
sudo sed -i '/- kube-apiserver/a\    - --insecure-bind-address=0.0.0.0' /etc/kubernetes/manifests/kube-apiserver.yaml
sudo systemctl restart kubelet.service
echo -e '\033[0;32m>>> SUCCESS: Install Kubernetes complete! <<<\033[0m'

sudo python3 ~/dorry-alpha/dorry-installation/MatchboxDorry-dorry-installation-*/install_platform.py
sudo rm -r ~/dorry-alpha
echo -e '\033[0;32m>>> Please visit https://<your ip>:4200 <<<\033[0m'
echo -e '\033[0;32m =================================== \033[0m'
echo -e '\033[0;32m   Username: dorry \033[0m'
echo -e '\033[0;32m   Password: abc123_ \033[0m'