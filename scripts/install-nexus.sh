#!/bin/sh

# Create nexus data repository
mkdir nexus-data

# Change the Data directory permission so Docker can access it
sudo chown -R 200 nexus-data

# Pull Nexus image
docker pull sonatype/nexus3

# Start Nexus
docker run -d -p 8081:8081 -p 8082:8082 -p 8083:8083 --name nexus --user root -v nexus-data:/nexus-data sonatype/nexus3