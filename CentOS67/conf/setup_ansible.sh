#!/bin/bash

# ANSIBLE 1.9.4 �̃C���X�g�[��
yum --enablerepo=epel -y install ansible

# �o�[�W�����Əꏊ�̊m�F
ansible --version
which ansible

exit 0
