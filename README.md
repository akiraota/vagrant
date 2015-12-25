ベースBOXの作成手順
===============

イメージからBOXを作成したり、バージョンアップなどでBOXを再作成するとき
OSごとにベースとなるBOXをイメージ化しておくと、各用途のサーバーを構築する際に
イメージの共有および構築時間の短縮などの効果が期待できる。

※VirtualBoxはチョコラティ、Vagrantは手作業でインストールされているものとする
※Vagrantのプラグインvagrant-vbguestは以下のコマンドでインストールされているものとする
>vagrant plugin install vagrant-vbguest

ここでは作業をWindowsクライアントで行うとして、
ベースBOXの作成場所を以下のフォルダで行ったものとする。
C:\Vagrant\rebox

■BOXの登録
OSインストール直後の状態であるBOXは以下の方法で入手
①VirtualBoxでISOイメージを使って手作業でインストール
②ATLASなどで配布されているBOX化済みOSイメージを登録
  >vagrant box add BOX名 BOXのURL
③Packerを使いBOXを作成
  調査中

■ベースBOXの作成準備

C:\Vagrant\rebox で仮想マシン作成済みなら仮想マシンや登録BOXを削除
1.コマンドプロンプト起動(VirtualBOXから削除)
  >cd C:\Vagrant\rebox
  >vagrant destroy
  >vagrant box remove centos-6.7

2.C:\Vagrant\rebox\.vagrantを削除

3.C:\Vagrant\rebox\Vagrantfileを削除

リモートリポジトリからVagrantBaseBoxプロジェクトをクローン
VagrantBaseBox
├CentOS
│└6.7
│　└rebox
│　　├conf
│　　│├provision.sh
│　　│└setup_centos67.sh
│　　├package.sh
│　　└Vagrantfile
└Windows
　├7x64
　│└
　└2012R2
　　└

4.ベースBOX作成用vagrantfileをC:\Vagrant\reboxにコピー
  最後のend前に以下があること
  config.vm.provision "shell", path: "./conf/provision.sh"

5.ベースBOX作成用confフォルダをC:\Vagrant\reboxにコピー

6.コマンドプロンプト起動（5～10分程度）
  自動的にVirtualBOXに仮想マシンの作成とVagrantのBOX登録を実施
  この時、ホストとゲストの間でVirtualBox Guest Additionsのバージョンが
  違う場合に、Vagranta-vbguestプラグインがゲストを更新してくれる。
  >cd C:\Vagrant\rebox
  >vagrant up

7.コマンドプロンプトでゲストOSを一旦停止
  >vagrant halt

8.ゲストOSを再度起動し問題ないか確認
  ※Guest Addtionがyum update後にもう一度更新される場合あり
  >vagrant up

■ベースBOXの作成
1.ベースBOX作成前にBOXのファイルサイズを小さくする処理を行うため
  TeraTermでゲストOSにSSH接続する
  IP:127.0.0.1
  Port:2222（デフォルトポートフォワード）
  ID/PASS:vagrant

2.パーミッションの確認
  /home/vagrant 700 or 711 or 755
  /home/vagrant/.ssh 700
  /home/vagrant/.ssh/authorized_keys 600

3.rootユーザーでシェルを実行する。
  su -
  cd /var
  mkdir usr
  cp -f /vagrant/package.sh /var/usr/package.sh
  /var/usr/package.sh > /var/usr/package.log 2>&1

4.ゲストOSが停止していることを確認しコマンドプロンプトで以下を実行
  ベースBOXが C:\Vagrant\rebox に package.box というファイルで作成される
  >cd C:\Vagrant\rebox
  >vagrant package

5.コマンドプロンプトで以下を実行しベースBOXを登録する（1分程度）
  >vagrant box add centos-6.7 C:\Vagrant\rebox\package.box

■ベースBOXの使用
C:\Vagrant\CentOS67 にベースBOXを使って仮想マシンを作成する

C:\Vagrant\CentOS67 で仮想マシン未作成ならvagrantfile作成
1.コマンドプロンプト起動
  >cd C:\Vagrant
  >mkdir CentOS67
  >cd CentOS67
  >vagrant init centos-6.7

C:\Vagrant\CentOS67 で仮想マシン作成済みなら仮想マシンを削除する
1.コマンドプロンプト起動(VirtualBOXから削除)
  >cd C:\Vagrant\CentOS67
  >vagrant destroy

2.C:\Vagrant\CentOS67\.vagrantを削除

仮想マシンを作成する
1.ゲストOSの起動（3分くらいで起動）
  >vagrant up

2.問題なく起動ができSSH接続できたらゲストOSを停止
  vagrantfileを差し替えるなどプロビジョニングして任意構成のサーバーを作成
  ここでVirtualBoxの設定を一時的に2CPUにするなど高速化をする（30分程度）
  >vagrant halt
  >vagrant up
  >vagrant provision
  または
  >vagrant reload --provision
