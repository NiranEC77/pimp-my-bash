#!/bin/bash
wget https://github.com/jonmosco/kube-ps1/archive/v0.7.0.tar.gz -P /tmp
tar -zxf /tmp/v0.7.0.tar.gz -C /tmp
chmod +x /tmp/kube-ps1-0.7.0/kube-ps1.sh
source /tmp/kube-ps1-0.7.0/kube-ps1.sh
/tmp/kube-ps1-0.7.0/kube-ps1.sh
kubeon -g
chmod +x /root/pimp-my-bash/kube-ps1/kube-ps1-startup.sh
echo "bash --init-file /root/pimp-my-bash/kube-ps1/kube-ps1-startup.sh" >>/root/.profile

exit 0
