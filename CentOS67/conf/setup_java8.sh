#!/bin/bash

# rpm�p�b�P�[�W���C���X�g�[��
cd /vagrant/conf/java8
rpm -ivh jdk-8u66-linux-x64.rpm

# ���ϐ��̒�`
echo 'JAVA_HOME=/usr/java/default' >> /etc/profile
echo 'export JAVA_HOME' >> /etc/profile
echo 'PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
echo 'export PATH' >> /etc/profile
echo 'CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar' >> /etc/profile
echo 'export CLASSPATH' >> /etc/profile

# ���ϐ��̔��f
#source /etc/profile

# �C���X�g�[������Ă���Java�̗D�揇�ʂ�\��
alternatives --display java

# �o�[�W�����Əꏊ�̊m�F
echo $JAVA_HOME
echo $PATH
echo $CLASSPATH
java -version
javac -version
which java

exit 0
