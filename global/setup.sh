#!/bin/bash

wget http://tamacom.com/global/global-6.6.2.tar.gz -P /tmp
cd /tmp
tar xzf ./global-6.6.2.tar.gz
cd ./global-6.6.2
./configure
make
sudo porg -lD "make install"
