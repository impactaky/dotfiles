#!/bin/bash

echo deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main | sudo tee /etc/apt/sources.list.d/google-chrome.list
sudo apt update
sudo apt install -y gnome-session vanilla-gnome-desktop google-chrome-stable
sudo pip3 install selenium chromedriver-binary
