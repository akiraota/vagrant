#!/bin/bash

# ANSIBLEのインストール
yum --enablerepo=epel -y install ansible

# バージョンと場所の確認
ansible --version
which ansible

exit 0
