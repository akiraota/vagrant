#!/bin/bash

# jenkins�̃C���X�g�[��
cd /var/tmp
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins

# �o�[�W�����Əꏊ�̊m�F
#jenkins -version
#which jenkins

# �ݒ�
cd /etc/sysconfig
cp -p jenkins jenkins.org
cp -f /vagrant/conf/etc/sysconfig/jenkins jenkins
#cp -p /???/config.xml /???/config.xml.org

# OS�N�����Ɏ����N��
chkconfig jenkins on

# �J�n
service jenkins start

exit 0
