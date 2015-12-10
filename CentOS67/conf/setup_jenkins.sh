#!/bin/bash

# jenkins 1.6 のインストール
cd /var/tmp
wget -O /etc/yum.repos.d/jenkins.repo -nv http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins

# バージョンと場所の確認
#jenkins -version
#which jenkins

# 設定
cd /etc/sysconfig
cp -p jenkins jenkins.org
cp -f /vagrant/conf/etc/sysconfig/jenkins jenkins
cd /etc/nginx/conf.d
cp -p default.conf default.conf.org
cp -f /vagrant/conf/etc/nginx/conf.d/default.conf default.conf

#cp -p /???/config.xml /???/config.xml.org

# OS起動時に自動起動
chkconfig jenkins on

# 開始
service nginx stop
service jenkins start
service nginx start

exit 0
