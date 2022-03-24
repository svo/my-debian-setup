#!/bin/bash

ansible-playbook -e "ansible_python_interpreter:'/usr/bin/python3'" -i "localhost," -c local -K playbook.yml &&

sudo apt -y autoremove
