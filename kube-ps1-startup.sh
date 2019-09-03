#!/bin/bash
source /tmp/kube-ps1-0.7.0/kube-ps1.sh
/tmp/kube-ps1-0.7.0/kube-ps1.sh
PS1='[$(kube_ps1)]\$ '
KUBE_PS1_SYMBOL_USE_IMG=true
