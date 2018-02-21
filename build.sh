#!/bin/bash

sudo apt-get -y update

sudo apt-get install -y ansible
sudo apt-get install -y plymouth plymouth-themes

ansible-playbook -i "localhost," -c local -K playbook.yml

sudo apt -y autoremove
