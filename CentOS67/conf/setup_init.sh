#!/bin/bash

# �G���^�[�v���C�Y Linux �p�̊g���p�b�P�[�W(EPEL) 
#yum -y localinstall http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sed -i.bak 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel*

# �t�@�C�A�E�H�[���̒�~
cp -p /etc/rc.d/init.d/iptables /etc/rc.d/init.d/iptables.org
/etc/rc.d/init.d/iptables stop

# OS�N�����Ƀt�@�C�A�E�H�[�����N�����Ȃ��悤�ݒ�
chkconfig iptables off
chkconfig ip6tables off

exit 0
