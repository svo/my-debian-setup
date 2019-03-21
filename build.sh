#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y plymouth plymouth-themes python3-pip

sudo -H pip3 install --upgrade pip
sudo -H pip3 install ansible==2.4.3.0

ansible-playbook -i "localhost," -c local -K playbook.yml

sudo apt -y autoremove
