#! /usr/bin/env bash 

echo "Clean up docker old version"
sudo yum -y remove docker \
                docker-client \
                docker-client-latest \
                docker-common \
                docker-latest \
                docker-latest-logrotate \
                docker-logrotate \
                docker-selinux \
                docker-engine-selinux \
                docker-engine
echo "Set the latest stable version docker" 
sudo yum -y install yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum makecache fast
echo "Install docker-ce"
sudo yum -y install docker-ce
echo "Create Docker groups"
#sudo groupadd docker
sudo gpasswd -a ${USER} docker
echo "Start docker" 
#sudo service docker start
sudo systemctl start docker
sudo systemctl enable docker
echo "Install python pip"
sudo pip install --upgrade pip
sudo yum -y install epel-release
sudo yum -y install python-pip
echo "Install docker-compose"
sudo pip install docker-compose
