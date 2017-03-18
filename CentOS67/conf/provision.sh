#!/bin/bash
# Xway ƒrƒ‹ƒhŠÂ‹«

echo 'BOX Provision Start' `date +"%Y/%m/%d %H:%M:%S"`

# OS
sudo /vagrant/conf/setup_init.sh > /vagrant/log/setup_init.log  2>&1

# JDK 1.8
sudo /vagrant/conf/setup_java8.sh > /vagrant/log/setup_java8.log 2>&1

# gradle
sudo /vagrant/conf/setup_gradle.sh > /vagrant/log/setup_gradle.log 2>&1

# git
sudo /vagrant/conf/setup_git.sh > /vagrant/log/setup_git.log 2>&1

# ruby
sudo /vagrant/conf/setup_ruby.sh > /vagrant/log/setup_ruby.log 2>&1

# ANSIBLE
sudo /vagrant/conf/setup_ansible.sh > /vagrant/log/setup_ansible.log 2>&1

# docker
sudo /vagrant/conf/setup_docker.sh > /vagrant/log/setup_docker.log 2>&1

# nginx
sudo /vagrant/conf/setup_nginx.sh > /vagrant/log/setup_nginx.log 2>&1

# Jenkins
sudo /vagrant/conf/setup_jenkins.sh > /vagrant/log/setup_jenkins.log 2>&1
#sudo /vagrant/conf/setup_jenkins_slave.sh > /vagrant/log/setup_jenkins.log 2>&1

# GitLAB(+Nginx,PostgreSQL,Redis)
#sudo /vagrant/conf/setup_gitlab.sh > /vagrant/log/setup_gitlab.log 2>&1

# Redmine(+MySQL,Apatche,Ruby)
#sudo /vagrant/conf/setup_redmine.sh > /vagrant/log/setup_redmine.log 2>&1

# packer


# PostgreSQL
#su -l root -c /vagrant/conf/setup_postgresql.sh > /vagrant/log/setup_postgresql.log 2>&1

# Tomcat
#su -l root -c /vagrant/conf/setup_tomcat.sh > /vagrant/log/setup_apache.log 2>&1

# Apache
#su -l root -c /vagrant/conf/setup_apache.sh > /vagrant/log/setup_tomcat.log 2>&1

# /etc/rc.d/rc.local
#su -l root -c /vagrant/conf/setup_etc.sh

echo 'BOX Provision Finish' `date +"%Y/%m/%d %H:%M:%S"`

exit 0
