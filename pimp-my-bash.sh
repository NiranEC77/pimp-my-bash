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

#Download zsh-autosuggestions by
sudo git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

#Download zsh-syntax-highlighting by
sudo git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

#create folder for kubectl plugin cache 
sudo mkdir  /usr/local/zshcache

#change permissions
sudo chmod 777 /usr/local/zshcache

#append the o=folowing lines to .zshrc before source (note plugins is already there)
plugins=(git kubectl docker kube-ps1 themes history common-aliases colored-man-pages zsh-autosuggestions zsh-syntax-highlighting )
ZSH_CACHE_DIR=/usr/local/zshcache


#Alias
alias kubectx='kubectl config get-contexts'
alias kubeset='kubectl config use-context'
alias k=kubectl
alias h='history |grep'


PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{yellow}%1~%f%b%)'
source ~/kube-ps1/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line


#If zsh not working run 'zsh' to test and add the follwing to .bashrc #
#https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/
#if test -t 1; then
#exec zsh
#fi

#To uninstall zsh https://askubuntu.com/questions/963874/uninstall-oh-my-zsh
#sudo chmod 777 ~/.oh-my-zsh/tools/uninstall.sh
#~/.oh-my-zsh/tools/uninstall.sh
