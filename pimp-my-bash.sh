#!/bin/bash
apt-get -y install jq

#Install pv for the demo-scripts
apt-get -y install pv

#Install kube-ps1
git clone https://github.com/jonmosco/kube-ps1
chmod +x kube-ps1/kube-ps1-install.sh
source ~/kube-ps1/kube-ps1.sh
PS1='[\e[0;33m\w $(kube_ps1)]\$ '


#Install kubectx
alias kubectx='kubectl config get-contexts'
alias kubeset='kubectl config set-context'
alias k=kubectl
alias h='history |grep'
exit 0
