#!/bin/bash

echo "This packet should install all required features for TCG"
echo "--------------------------------------------------------"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install ffmpeg toilet figlet youtube-dl unzip rename -y
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
sudo pip3 install --upgrade google-api-python-client oauth2client progressbar2 testresources

wget https://github.com/tokland/youtube-upload/archive/master.zip
unzip master.zip
cd youtube-upload-master
sudo python3 setup.py install
