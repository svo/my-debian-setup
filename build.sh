#!/bin/bash

sudo apt-get -y --allow-releaseinfo-change update
sudo apt-get -y upgrade
sudo apt-get install -y python3-pip

python3 -m pip install ansible

python3 -m ansible-playbook -e "ansible_python_interpreter:'/usr/bin/python3'" -i "localhost," -c local -K playbook.yml

sudo apt -y autoremove
