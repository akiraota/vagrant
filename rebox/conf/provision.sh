#!/bin/bash

echo 'BOX Provision Start' `date +"%Y/%m/%d %H:%M:%S"`

# OS
su -l root -c /vagrant/conf/setup_centos67.sh > /vagrant/conf/install_centos67.log  2>&1

echo 'BOX Provision Finish' `date +"%Y/%m/%d %H:%M:%S"`

exit 0
