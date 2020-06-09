#!/bin/bash
apt-get -y install jq

#Install pv for the demo-scripts
apt-get -y install pv

#Install kube-ps1
git clone https://github.com/jonmosco/kube-ps1
chmod +x kube-ps1/kube-ps1.sh

#source ~/kube-ps1/kube-ps1.sh
#PS1='[\e[0;33m\w $(kube_ps1)]\$ '

#Install zsh
sudo apt install zsh

#Install ohmyzsh
sudo sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#Change Theme
sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="agnoster"/g' ~/.zshrc
 
#Change default shell
sudo chsh -s $(which zsh)


#Alias
alias kubectx='kubectl config get-contexts'
alias kubeset='kubectl config use-context'
alias k=kubectl
alias h='history |grep'


PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{yellow}%1~%f%b'
source ~/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%F{240}(%b)%r%f'
zstyle ':vcs_info:*' enable git



#If zsh not working run 'zsh' to test and add the follwing to .bashrc #
#https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/
#if test -t 1; then
#exec zsh
#fi

#To uninstall zsh https://askubuntu.com/questions/963874/uninstall-oh-my-zsh
#sudo chmod 777 ~/.oh-my-zsh/tools/uninstall.sh
#~/.oh-my-zsh/tools/uninstall.sh
