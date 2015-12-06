#!/bin/bash

# ユーザー・グループの追加
useradd gituser
passwd gituser
groupadd gitgroup
usermod -G gitgroup gituser

# 必要なパッケージのインストール
yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker

# git 2.6.3 のインストール
cd /usr/local/src
wget https://www.kernel.org/pub/software/scm/git/git-2.6.3.tar.gz
tar zxvf git-2.6.3.tar.gz
cd git-2.6.3
make prefix=/usr/local all
make prefix=/usr/local install

# バージョンと場所の確認
git --version
which git

# gitの設定
#git config --global user.name  "GitLab"
#git config --global user.email "gitlab@git.example.jp"


#mkdir -p /xxx/git/rep.git
#cd /xxx/git/
#chown gituser rep.git/
#su - gituser
#cd /xxx/git/rep.git/
#git init --bare --shared

exit 0
