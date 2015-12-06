#!/bin/bash

# rpmパッケージをインストール
cd /vagrant/conf/java8
rpm -ivh jdk-8u66-linux-x64.rpm

# 環境変数の定義
echo 'JAVA_HOME=/usr/java/default' >> /etc/profile
echo 'export JAVA_HOME' >> /etc/profile
echo 'PATH=$PATH:$JAVA_HOME/bin' >> /etc/profile
echo 'export PATH' >> /etc/profile
echo 'CLASSPATH=.:$JAVA_HOME/jre/lib:$JAVA_HOME/lib:$JAVA_HOME/lib/tools.jar' >> /etc/profile
echo 'export CLASSPATH' >> /etc/profile

# 環境変数の反映
#source /etc/profile

# インストールされているJavaの優先順位を表示
alternatives --display java

# バージョンと場所の確認
echo $JAVA_HOME
echo $PATH
echo $CLASSPATH
java -version
javac -version
which java

exit 0
