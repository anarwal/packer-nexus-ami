#!/bin/sh

# Update yum repository
sudo yum update -y

## Install docker
# Setup the repository
sudo yum install -y yum-utils device-mapper-persistent-data lvm2

# Setup stable repository
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

#Install docker engine
sudo yum install docker-ce docker-ce-cli containerd.io

# Set docker to start automatically at boot time
sudo systemctl enable docker

# Changing user to docker
sudo usermod -aG docker ec2-user

# Start docker service
sudo systemctl start docker

# Create directory for nexus
mkdir nexus-data

# Change the Data directory permission so Docker can access it
chown -R 200 nexus-data

# Pull Nexus image
docker pull sonatype/nexus3

# Start Nexus
docker run -d -p 8081:8081 -p 8082:8082 -p 8083:8083 --name nexus --user root -v nexus-data:/nexus-data sonatype/nexus3