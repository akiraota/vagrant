#!/bin/bash

echo 'BOX Provision Start' `date`

# OS
su -l root -c /vagrant/conf/setup_init.sh > /vagrant/conf/install_init.log  2>&1

# JDK 1.8
su -l root -c /vagrant/conf/setup_java8.sh > /vagrant/conf/install_java8.log 2>&1

# gradle
su -l root -c /vagrant/conf/setup_gradle.sh > /vagrant/conf/install_gradle.log 2>&1

# git
su -l root -c /vagrant/conf/setup_git.sh > /vagrant/conf/install_git.log 2>&1

# ruby
su -l root -c /vagrant/conf/setup_ruby.sh > /vagrant/conf/install_ruby.log 2>&1

# ANSIBLE
su -l root -c /vagrant/conf/setup_ansible.sh > /vagrant/conf/install_ansible.log 2>&1

# docker
su -l root -c /vagrant/conf/setup_docker.sh > /vagrant/conf/install_docker.log 2>&1

# Jenkins
su -l root -c /vagrant/conf/setup_jenkins.sh > /vagrant/conf/install_jenkins.log 2>&1

# GitLAB(+Nginx,PostgreSQL,Redis)
#su -l root -c /vagrant/conf/setup_gitlab.sh > /vagrant/conf/install_gitlab.log 2>&1

# Redmine(+MySQL,Apatche,Ruby)
#su -l root -c /vagrant/conf/setup_redmine.sh > /vagrant/conf/install_redmine.log 2>&1

# packer


echo 'BOX Provision Finish' `date`

exit 0
