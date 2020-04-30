#!/bin/bash

# install node
curl -sL https://deb.nodesource.com/setup_13.x | sudo -E bash -
apt-get install nodejs
npm install -g dockerlint

# install awscli
pip install awscli

# install docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt list --upgradable
sudo apt-get install -y docker-ce
sudo usermod -aG docker ubuntu
sudo systemctl restart docker

# run jenkins
sudo chown -R 1000:1000 /var/jenkins_home
sudo docker run -p 8080:8080 -p 50000:50000 -v /var/jenkins_home:/var/jenkins_home -d --name jenkins adenijiazeez/jenkins-docker

# show endpoint
echo 'Jenkins installed'
echo 'You should now be able to access jenkins at: http://'$(curl -s ifconfig.co)':8080'