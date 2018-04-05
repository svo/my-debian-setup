#!/bin/bash

sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get install -y plymouth plymouth-themes python-pip

sudo -H pip install --upgrade pip
sudo -H pip install ansible==2.4.3.0

ansible-playbook -i "localhost," -c local -K playbook.yml

sudo apt -y autoremove
