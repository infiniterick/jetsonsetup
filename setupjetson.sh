#!/bin/sh

#enable passwordless login
mkdir ~/.ssh
cat id_rsa.pub >> ~/.ssh/authorized_keys

#turn of SUDO password for hdub
sudo sh -c "echo \"hdub     ALL=(ALL) NOPASSWD:ALL\" >> /etc/sudoers"

sudo apt-get install -y python-pip

#Jetson specific jtop
sudo pip install jetson_stats

#best top program
sudo snap install bashtop

#NVME temp readout
sudo apt-get install -y nvme-cli

#VS Code for ARM
wget -O vscode-arm.sh https://code.headmelted.com/installers/apt.sh
chmod +x ./vscode-arm.sh
sudo ./vscode-arm.sh


#DotNet Core ARM manual install
wget https://download.visualstudio.microsoft.com/download/pr/5ee48114-19bf-4a28-89b6-37cab15ec3f2/f5d1f54ca93ceb8be7d8e37029c8e0f2/dotnet-sdk-3.1.302-linux-arm64.tar.gz
mkdir -p "$HOME/dotnet" && tar zxf dotnet-sdk-3.1.302-linux-arm64.tar.gz -C "$HOME/dotnet"
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet

echo "export PATH=$PATH:$HOME/dotnet" >> $HOME/.bashrc
echo "export DOTNET_ROOT=$HOME/dotnet" >> $HOME/.bashrc

