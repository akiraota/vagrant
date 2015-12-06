#!/bin/bash

echo 'BOX Provision Start' `date`

# OS
su -l root -c /vagrant/conf/setup_centos67.sh > /vagrant/conf/install_centos67.log  2>&1

# パッケージ前処理
su -l root -c /vagrant/conf/package.sh > /vagrant/conf/install_package.log 2>&1

su -l root -c umount /vagrant >> /vagrant/conf/install_package.log 2>&1
su -l root -c rm /root/.bash_history >> /vagrant/conf/install_package.log 2>&1
su -l root -c shutdown -h now >> /vagrant/conf/install_package.log 2>&1

echo 'BOX Provision Finish' `date`

exit 0
