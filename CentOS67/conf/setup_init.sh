#!/bin/bash

# エンタープライズ Linux 用の拡張パッケージ(EPEL) 
#yum -y localinstall http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -ivh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
sed -i.bak 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel*

# ファイアウォールの停止
cp -p /etc/rc.d/init.d/iptables /etc/rc.d/init.d/iptables.org
/etc/rc.d/init.d/iptables stop

# OS起動時にファイアウォールを起動しないよう設定
chkconfig iptables off
chkconfig ip6tables off

exit 0
