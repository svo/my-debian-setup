#!/bin/bash

sudo apt-get -y --allow-releaseinfo-change update &&
sudo apt-get -y upgrade &&
sudo apt-get install -y python3-full &&

sudo apt-get install -y ansible
