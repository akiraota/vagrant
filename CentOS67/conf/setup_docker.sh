#!/bin/bash

# docker 1.7.1�̃C���X�g�[��
yum --enablerepo=epel -y install docker-io

# �o�[�W�����Əꏊ�̊m�F
docker --version
which docker

# OS�N�����Ɏ����N��
chkconfig docker on

# �J�n
service docker start

exit 0
