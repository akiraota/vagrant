#!/bin/bash

# dockerのインストール
yum --enablerepo=epel -y install docker-io

# バージョンと場所の確認
docker --version
which docker

# OS起動時に自動起動
chkconfig docker on

# 開始
service docker start

exit 0
