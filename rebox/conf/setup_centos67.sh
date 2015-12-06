#!/bin/bash

# TIMEZONE
cp -p /etc/localtime /etc/localtime.org
cp -f /usr/share/zoneinfo/Japan /etc/localtime
mv /etc/sysconfig/clock /etc/sysconfig/clock.org
cat << TIME > /etc/sysconfig/clock
ZONE="Asia/Tokyo"
UTC=false
TIME
source /etc/sysconfig/clock

# yum
yum update
yum install wget
yum install unzip

# locale
yum -y groupinstall "Japanese Support"
localedef -f UTF-8 -i ja_JP ja_JP.utf8
mv /etc/sysconfig/i18n /etc/sysconfig/i18n.org
cat << LANG > /etc/sysconfig/i18n
LANG="ja_JP.UTF-8"
SYSFONT="latarcyrheb-sun16"
LANG

# SELinux‚Ì–³Œø‰»
cp -p /etc/selinux/conf /etc/selinux/conf.org
cp -f /vagrant/conf/etc/selinux/conf /etc/selinux/conf

# SELinux‚ÌˆêŽž–³Œø‰»
setenforce 0

exit 0
