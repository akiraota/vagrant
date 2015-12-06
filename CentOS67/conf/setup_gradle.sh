#!/bin/bash

# gradle
cd /usr/local
wget https://services.gradle.org/distributions/gradle-2.8-all.zip
unzip -q gradle-2.8-all.zip

# �����N�쐬
ln -s gradle-2.8 gradle

#���ϐ��̒�`
echo 'GRADLE_HOME=/usr/local/gradle' >> /etc/profile
echo 'export GRADLE_HOME' >> /etc/profile
echo 'PATH=$PATH:$GRADLE_HOME/bin' >> /etc/profile
echo 'export PATH' >> /etc/profile

# ���ϐ��̔��f
source /etc/profile

# �o�[�W�����Əꏊ�̊m�F
echo $GRADLE_HOME
echo $PATH
gradle -v
which gradle

exit 0
