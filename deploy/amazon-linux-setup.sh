#!/bin/bash

# setup Amazon Linux 2023 for Docker and Docker Compose
sudo yum update
sudo yum install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m) \
    -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
# exit and log back in

# create docker-compose.yml
docker-compose run feed download --wiki --grid
docker run -v /data/data:/tileset openmaptiles/openmaptiles-tools download-osm north-america
