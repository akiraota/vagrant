�x�[�XBOX�̍쐬�菇
===============

�C���[�W����BOX���쐬������A�o�[�W�����A�b�v�Ȃǂ�BOX���č쐬����Ƃ�
OS���ƂɃx�[�X�ƂȂ�BOX���C���[�W�����Ă����ƁA�e�p�r�̃T�[�o�[���\�z����ۂ�
�C���[�W�̋��L����э\�z���Ԃ̒Z�k�Ȃǂ̌��ʂ����҂ł���B

��VirtualBox�̓`���R���e�B�AVagrant�͎��ƂŃC���X�g�[������Ă�����̂Ƃ���
��Vagrant�̃v���O�C��vagrant-vbguest�͈ȉ��̃R�}���h�ŃC���X�g�[������Ă�����̂Ƃ���
>vagrant plugin install vagrant-vbguest

�����ł͍�Ƃ�Windows�N���C�A���g�ōs���Ƃ��āA
�x�[�XBOX�̍쐬�ꏊ���ȉ��̃t�H���_�ōs�������̂Ƃ���B
C:\Vagrant\rebox

��BOX�̓o�^
OS�C���X�g�[������̏�Ԃł���BOX�͈ȉ��̕��@�œ���
�@VirtualBox��ISO�C���[�W���g���Ď��ƂŃC���X�g�[��
�AATLAS�ȂǂŔz�z����Ă���BOX���ς�OS�C���[�W��o�^
  >vagrant box add BOX�� BOX��URL
�BPacker���g��BOX���쐬
  ������

���x�[�XBOX�̍쐬����

C:\Vagrant\rebox �ŉ��z�}�V���쐬�ς݂Ȃ牼�z�}�V����o�^BOX���폜
1.�R�}���h�v�����v�g�N��(VirtualBOX����폜)
  >cd C:\Vagrant\rebox
  >vagrant destroy
  >vagrant box remove centos-6.7

2.C:\Vagrant\rebox\.vagrant���폜

3.C:\Vagrant\rebox\Vagrantfile���폜

�����[�g���|�W�g������VagrantBaseBox�v���W�F�N�g���N���[��
VagrantBaseBox
��CentOS
����6.7
���@��rebox
���@�@��conf
���@�@����provision.sh
���@�@����setup_centos67.sh
���@�@��package.sh
���@�@��Vagrantfile
��Windows
�@��7x64
�@����
�@��2012R2
�@�@��

4.�x�[�XBOX�쐬�pvagrantfile��C:\Vagrant\rebox�ɃR�s�[
  �Ō��end�O�Ɉȉ������邱��
  config.vm.provision "shell", path: "./conf/provision.sh"

5.�x�[�XBOX�쐬�pconf�t�H���_��C:\Vagrant\rebox�ɃR�s�[

6.�R�}���h�v�����v�g�N���i5�`10�����x�j
  �����I��VirtualBOX�ɉ��z�}�V���̍쐬��Vagrant��BOX�o�^�����{
  ���̎��A�z�X�g�ƃQ�X�g�̊Ԃ�VirtualBox Guest Additions�̃o�[�W������
  �Ⴄ�ꍇ�ɁAVagranta-vbguest�v���O�C�����Q�X�g���X�V���Ă����B
  >cd C:\Vagrant\rebox
  >vagrant up

7.�R�}���h�v�����v�g�ŃQ�X�gOS����U��~
  >vagrant halt

8.�Q�X�gOS���ēx�N�������Ȃ����m�F
  ��Guest Addtion��yum update��ɂ�����x�X�V�����ꍇ����
  >vagrant up

���x�[�XBOX�̍쐬
1.�x�[�XBOX�쐬�O��BOX�̃t�@�C���T�C�Y�����������鏈�����s������
  TeraTerm�ŃQ�X�gOS��SSH�ڑ�����
  IP:127.0.0.1
  Port:2222�i�f�t�H���g�|�[�g�t�H���[�h�j
  ID/PASS:vagrant

2.�p�[�~�b�V�����̊m�F
  /home/vagrant 700 or 711 or 755
  /home/vagrant/.ssh 700
  /home/vagrant/.ssh/authorized_keys 600

3.root���[�U�[�ŃV�F�������s����B
  su -
  cd /var
  mkdir usr
  cp -f /vagrant/package.sh /var/usr/package.sh
  /var/usr/package.sh > /var/usr/package.log 2>&1

4.�Q�X�gOS����~���Ă��邱�Ƃ��m�F���R�}���h�v�����v�g�ňȉ������s
  �x�[�XBOX�� C:\Vagrant\rebox �� package.box �Ƃ����t�@�C���ō쐬�����
  >cd C:\Vagrant\rebox
  >vagrant package

5.�R�}���h�v�����v�g�ňȉ������s���x�[�XBOX��o�^����i1�����x�j
  >vagrant box add centos-6.7 C:\Vagrant\rebox\package.box

���x�[�XBOX�̎g�p
C:\Vagrant\CentOS67 �Ƀx�[�XBOX���g���ĉ��z�}�V�����쐬����

C:\Vagrant\CentOS67 �ŉ��z�}�V�����쐬�Ȃ�vagrantfile�쐬
1.�R�}���h�v�����v�g�N��
  >cd C:\Vagrant
  >mkdir CentOS67
  >cd CentOS67
  >vagrant init centos-6.7

C:\Vagrant\CentOS67 �ŉ��z�}�V���쐬�ς݂Ȃ牼�z�}�V�����폜����
1.�R�}���h�v�����v�g�N��(VirtualBOX����폜)
  >cd C:\Vagrant\CentOS67
  >vagrant destroy

2.C:\Vagrant\CentOS67\.vagrant���폜

���z�}�V�����쐬����
1.�Q�X�gOS�̋N���i3�����炢�ŋN���j
  >vagrant up

2.���Ȃ��N�����ł�SSH�ڑ��ł�����Q�X�gOS���~
  vagrantfile�������ւ���Ȃǃv���r�W���j���O���ĔC�Ӎ\���̃T�[�o�[���쐬
  ������VirtualBox�̐ݒ���ꎞ�I��2CPU�ɂ���ȂǍ�����������i30�����x�j
  >vagrant halt
  >vagrant up
  >vagrant provision
  �܂���
  >vagrant reload --provision
