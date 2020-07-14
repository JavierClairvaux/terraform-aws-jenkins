#!/bin/bash

sudo yum update -y 
sudo amazon-linux-extras install docker -y
sudo systemctl enable docker
sudo service docker start
sudo usermod -a -G docker ec2-user

sudo docker run --name myjenkins -p 8080:8080 -p 50000:50000 -v /var/jenkins_home jenkins
