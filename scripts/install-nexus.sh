#!/bin/sh

# Create nexus data repository
mkdir nexus-data

# Change the Data directory permission so Docker can access it
sudo chown -R 200 nexus-data

# Pull Nexus image
docker pull sonatype/nexus3