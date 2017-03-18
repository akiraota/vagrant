#!/bin/bash

# packerのインストール
mkdir /home/vagrant/packer
cd /home/vagrant/packer
wget -nv https://dl.bintray.com/mitchellh/packer/0.5.2_linux_amd64.zip
unzip -q 0.5.2_linux_amd64.zip
echo "export PATH=$PATH:/home/vagrant/packer" > /home/vagrant/.bashrc
