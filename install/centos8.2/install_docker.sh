#! /usr/bin/env bash 

echo "Clean up docker old version"
yum -y remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
echo "Set the latest stable version docker"
yum install -y https://download.docker.com/linux/fedora/30/x86_64/stable/Packages/containerd.io-1.2.6-3.3.fc30.x86_64.rpm
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo 
yum makecache
echo "Install docker-ce"
yum -y install docker-ce docker-ce-cli --nobest
echo "Start docker"
#sudo service docker start
systemctl start docker
systemctl enable docker
systemctl status docker
echo "Install docker-compose"
curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
usermod -aG docker root 
