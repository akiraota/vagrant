#!/bin/bash

# Apache�̒�~


# postfix�̋N��
#yum install curl openssh-server postfix cronie
service postfix start
chkconfig postfix on
#lokkit -s http -s ssh

# gitlab 7.13.5�̃C���X�g�[��
cd /var/tmp
curl -s https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.rpm.sh | sudo bash
yum -y install gitlab-ce-7.13.5-ce.0.el6.x86_64

# gitlab�̓��{�ꉻ
yum -y install patch
cd /var/tmp
wget -nv https://raw.githubusercontent.com/ksoichiro/gitlab-i18n-patch/master/patches/v7.13.5/app_ja.patch
cd /opt/gitlab/embedded/service/gitlab-rails
patch -p < /var/tmp/app_ja.patch

#cd /opt/gitlab/embedded/service/gitlab-rails
rm -rf public/assets
PATH=/opt/gitlab/embedded/bin:$PATH
export PATH
bundle exec rake assets:precompile RAILS_ENV=production

# GitLab�̐ݒ�
cp -p /etc/gitlab/gitlab.rb /etc/gitlab/gitlab.rb.org

# �J�n
#gitlab-ctl reconfigure

exit 0
