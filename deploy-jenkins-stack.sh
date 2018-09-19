#!/bin/sh

DATE=$(date -I)

docker build . --no-cache -t katson95/jenkins:$DATE
docker tag katson95/jenkins:$DATE katson95/jenkins:lts 
docker tag katson95/jenkins:$DATE katson95/jenkins:latest

docker push katson95/jenkins:$DATE
docker push katson95/jenkins:latest
docker push katson95/jenkins:lts

docker stack rm jenkins
sleep 15

docker stack deploy -c docker-compose.yml jenkins
