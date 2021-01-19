!/bin/bash
sudo apt-get -y install jq

#Install pv for the demo-scripts
sudo apt-get -y install pv

#Install kube-ps1
sudo git clone https://github.com/jonmosco/kube-ps1
sudo chmod +x kube-ps1/kube-ps1.sh

#source ~/kube-ps1/kube-ps1.sh
#PS1='[\e[0;33m\w $(kube_ps1)]\$ '

#Install zsh
sudo apt -y install zsh

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
sed -i 's/plugins=(git/plugins=(git kubectl docker kube-ps1 themes history common-aliases colored-man-pages zsh-autosuggestions zsh-syntax-highlighting/' ~/.zshrc 
#.zshrc plugins=(git kubectl docker kube-ps1 themes history common-aliases colored-man-pages zsh-autosuggestions zsh-syntax-highlighting )
echo "ZSH_CACHE_DIR=/usr/local/zshcache" >>~/.zshrc


#Alias
echo "alias kubectx='kubectl config get-contexts'" >>~/.zshrc
echo alias kubeset='kubectl config use-context' >>~/.zshrc
echo alias k=kubectl >>~/.zshrc
echo alias h='history |grep' >>~/.zshrc


echo "PROMPT='%(?.%F{green}√.%F{red}?%?)%f %B%F{yellow}%1~%f%b%)'" >>~/.zshrc
echo "source ~/kube-ps1/kube-ps1.sh" >>~/.zshrc
echo "PROMPT='$(kube_ps1)'$PROMPT" >>~/.zshrc
echo "bindkey '^[[H' beginning-of-line" >>~/.zshrc
echo "bindkey '^[[F' end-of-line" >>~/.zshrc


#If zsh not working run 'zsh' to test and add the follwing to .bashrc #
#https://blog.joaograssi.com/windows-subsystem-for-linux-with-oh-my-zsh-conemu/
#if test -t 1; then
#exec zsh
#fi

#To uninstall zsh https://askubuntu.com/questions/963874/uninstall-oh-my-zsh
#sudo chmod 777 ~/.oh-my-zsh/tools/uninstall.sh
#~/.oh-my-zsh/tools/uninstall.sh
