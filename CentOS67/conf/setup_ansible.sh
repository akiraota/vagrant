#!/bin/bash

# ANSIBLE 1.9.4 のインストール
yum --enablerepo=epel -y install ansible

# pywinrmのインストール
curl -sL https://bootstrap.pypa.io/get-pip.py | python
pip install pywinrm

# バージョンと場所の確認
ansible --version
which ansible

exit 0
