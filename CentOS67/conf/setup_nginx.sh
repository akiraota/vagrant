#!/bin/bash

# nginx 1.8 のインストール
rpm -ivh http://nginx.org/packages/centos/6/noarch/RPMS/nginx-release-centos-6-0.el6.ngx.noarch.rpm
yum -y install nginx

# バージョンと場所の確認
nginx -v
which nginx

# OS起動時に自動起動
chkconfig nginx on

# 開始
service nginx start

exit 0
