#!/bin/bash

# jenkinsのインストール
cd /var/tmp
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins

# バージョンと場所の確認
#jenkins -version
#which jenkins

# 設定
cd /etc/sysconfig
cp -p jenkins jenkins.org
cp -f /vagrant/conf/etc/sysconfig/jenkins jenkins
#cp -p /???/config.xml /???/config.xml.org

# OS起動時に自動起動
chkconfig jenkins on

# 開始
service jenkins start

exit 0
