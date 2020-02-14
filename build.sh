#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip

sudo -H pip3 install --upgrade pip3
sudo -H pip3 install ansible

ansible-playbook -i "localhost," -c local -K playbook.yml

sudo apt -y autoremove
