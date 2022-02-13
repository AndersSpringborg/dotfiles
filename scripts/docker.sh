#!/usr/bin/env bash
sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# TODO Fix this with color
printf "Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint."
sudo apt-key fingerprint 0EBFCD88
read -p "";


sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io -y

sudo usermod -aG docker $USER