#!/bin/bash

sudo apt-get -y update

sudo apt-get install -y ansible

ansible-playbook -i "localhost," -c local -K playbook.yml

sudo apt -y autoremove
