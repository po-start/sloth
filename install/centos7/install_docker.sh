#! /usr/bin/env bash

echo "Clean up docker old version"
sudo yum -y remove docker docker-common container-selinux
echo "Set the latest stable version docker"
sudo yum -y install yum-utils
sudo yum-config-manager --add-repo https://docs.docker.com/v1.13/engine/installation/linux/repo_files/centos/docker.repo
sudo yum makecache fast
echo "Install docker-engine"
sudo yum -y install docker-engine
echo "Start docker"
#sudo service docker start
sudo systemctl start docker
sudo systemctl enable docker
echo "Install python pip"
sudo yum -y install epel-release
sudo yum -y install python-pip
echo "Install docker-compose"
sudo pip install docker-compose
