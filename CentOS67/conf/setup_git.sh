#!/bin/bash

# ���[�U�[�E�O���[�v�̒ǉ�
useradd gituser
passwd gituser
groupadd gitgroup
usermod -G gitgroup gituser

# �K�v�ȃp�b�P�[�W�̃C���X�g�[��
yum -y install curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker

# git 2.6.3 �̃C���X�g�[��
cd /usr/local/src
wget https://www.kernel.org/pub/software/scm/git/git-2.6.3.tar.gz
tar zxvf git-2.6.3.tar.gz
cd git-2.6.3
make prefix=/usr/local all
make prefix=/usr/local install

# �o�[�W�����Əꏊ�̊m�F
git --version
which git

# git�̐ݒ�
#git config --global user.name  "GitLab"
#git config --global user.email "gitlab@git.example.jp"


#mkdir -p /xxx/git/rep.git
#cd /xxx/git/
#chown gituser rep.git/
#su - gituser
#cd /xxx/git/rep.git/
#git init --bare --shared

exit 0
