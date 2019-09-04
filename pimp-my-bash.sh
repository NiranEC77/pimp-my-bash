#!/bin/bash
apt-get -y install jq

#Install pv for the demo-scripts
apt-get -y install pv

#Install kube-ps1
source kube-ps1/kube-ps1-install.sh

#Install kubectx
source kubectx/install-kubctx.sh
exit 0
