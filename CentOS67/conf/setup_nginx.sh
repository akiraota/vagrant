#!/bin/bash

# nginx 1.8 �̃C���X�g�[��
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum -y install nginx

# �o�[�W�����Əꏊ�̊m�F
nginx -v
which nginx

# OS�N�����Ɏ����N��
chkconfig nginx on

# �J�n
service nginx start

exit 0
