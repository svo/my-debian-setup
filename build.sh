#!/bin/bash

sudo apt-get -y --allow-releaseinfo-change update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip

sudo -H pip3 install --upgrade pip
sudo -H pip3 install ansible

ansible-playbook -e "ansible_python_interpreter:'/usr/bin/python3'" -i "localhost," -c local -K playbook.yml

sudo apt -y autoremove
