#!/bin/bash

yum update -y


rpm --import https://yum.corretto.aws/corretto.key
curl -Lo /etc/yum.repos.d/corretto.repo https://yum.corretto.aws/corretto.repo
yum install -y java-21-amazon-corretto-devel

mkdir -p /home/ec2-user/backend


chown -R ec2-user:ec2-user /home/ec2-user/backend


