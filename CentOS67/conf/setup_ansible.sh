#!/bin/bash

# ANSIBLE 1.9.4 �̃C���X�g�[��
yum --enablerepo=epel -y install ansible

# pywinrm�̃C���X�g�[��
curl -sL https://bootstrap.pypa.io/get-pip.py | python
pip install pywinrm

# �o�[�W�����Əꏊ�̊m�F
ansible --version
which ansible

exit 0
