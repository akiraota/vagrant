ベースBOXの作成手順
===============

はじめに
---------------

イメージからBOXを作成したり、バージョンアップなどでBOXを再作成するとき、  
OSごとにベースとなるBOXをイメージ化しておくと、各用途のサーバーを構築する際に  
イメージの共有および構築時間の短縮などの効果が期待できる。

※ホストOSには[チョコラティ](https://chocolatey.org/)でVirtualBox、Vagrantがインストールされているものとする。  
※Vagrantのプラグインvagrant-vbguestは以下のコマンドでインストールされているものとする。

`>vagrant plugin install vagrant-vbguest`

ここではホストOS側（Windows）で行う作業として説明する。  
また、ベースBOXの作成は `C:\Vagrant\rebox` フォルダで行ったものとする。

## BOXの登録

OSインストール直後の状態であるBOXは以下の方法で入手  
1.VirtualBoxでISOイメージを使って手作業でインストール

2.ATLASなどで配布されているBOX化済みOSイメージを登録

    >vagrant box add BOX名 BOXのURL

3.Packerを使いBOXを作成  
調査中

## ベースBOXの作成準備

`C:\Vagrant\rebox` で仮想マシン作成済みなら1～3で仮想マシンや登録BOXを削除

1.コマンドプロンプト起動(VirtualBOXから削除)

    >cd C:\Vagrant\rebox
    >vagrant destroy
    >vagrant box remove centos-6.7

2.`C:\Vagrant\rebox\.vagrant` を削除

3.`C:\Vagrant\rebox\Vagrantfile` を削除

4.GitBucketのリモートリポジトリからVagrantBaseBoxプロジェクトを任意のフォルダにクローン

    VagrantBaseBox
    ├ CentOS
    │　└ 6.7
    │　　└ rebox
    │　　　　├ conf
    │　　　　│　　├ provision.sh
    │　　　　│　　└ setup_centos67.sh
    │　　　　├ package.sh
    │　　　　└ Vagrantfile
    └ Windows
    　　├ win7x64
    　　│　　└ 
    　　└ win2012R2
    　　　　　└ 

5.ベースBOX作成用Vagrantfileを `C:\Vagrant\rebox` にコピー

6.ベースBOX作成用confフォルダを `C:\Vagrant\rebox` にコピー

7.コマンドプロンプト起動（5～10分程度）  
自動的にVirtualBoxで仮想マシンの作成とVagrantのBOX登録を実施する。  
この時、ホストとゲストの間でVirtualBox Guest Additionsのバージョンが違う場合に、  
Vagranta-vbguestプラグインがゲストを更新してくれる。

    >cd C:\Vagrant\rebox
    >vagrant up

8.コマンドプロンプトでゲストOSを一旦停止

    >vagrant halt

9.ゲストOSを再度起動し問題ないか確認  
※Guest Addtionがyum update後にもう一度更新される場合あり

    >vagrant up

## ベースBOXの作成

1.ベースBOX作成前にBOXのファイルサイズを小さくする処理を行うためTeraTermでゲストOSにSSH接続する  
ホストOSからの場合

- IP:127.0.0.1
- Port:2222（デフォルトポートフォワード）
- ID/PASS:vagrant/vagrant

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
ベースBOXが `C:\Vagrant\rebox` に `package.box` というファイルで作成される

    >cd C:\Vagrant\rebox
    >vagrant package`

5.コマンドプロンプトで以下を実行しベースBOXを登録する（1分程度）

    >vagrant box add centos-6.7 C:\Vagrant\rebox\package.box

## ベースBOXの使用

`C:\Vagrant\CentOS67` にベースBOXを使って仮想マシンを作成する

#### 仮想マシンの作成準備

- `C:\Vagrant\CentOS67` で仮想マシン未作成ならvagrantfile作成

1.コマンドプロンプト起動

    >cd C:\Vagrant
    >mkdir CentOS67
    >cd CentOS67
    >vagrant init centos-6.7

- `C:\Vagrant\CentOS67` で仮想マシン作成済みなら仮想マシンを削除する

1.コマンドプロンプト起動

    >cd C:\Vagrant\CentOS67
    >vagrant destroy

2.`C:\Vagrant\CentOS67\.vagrant` を削除

#### 仮想マシンを作成する

1.ゲストOSの起動（3分くらいで起動）

    >vagrant up

2.問題なく起動ができSSH接続できたらゲストOSを停止

    >vagrant halt

3.vagrantfileを差し替えるなどプロビジョニングして任意構成のサーバーを作成  
ここでVirtualBoxの設定を一時的に2CPUにするなど高速化をする。（30分程度）

    >vagrant up
    >vagrant provision
    または
    >vagrant reload --provision
