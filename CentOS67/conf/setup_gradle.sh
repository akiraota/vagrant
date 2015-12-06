#!/bin/bash

# gradle
cd /usr/local
wget https://services.gradle.org/distributions/gradle-2.8-all.zip
unzip -q gradle-2.8-all.zip

# リンク作成
ln -s gradle-2.8 gradle

#環境変数の定義
echo 'GRADLE_HOME=/usr/local/gradle' >> /etc/profile
echo 'export GRADLE_HOME' >> /etc/profile
echo 'PATH=$PATH:$GRADLE_HOME/bin' >> /etc/profile
echo 'export PATH' >> /etc/profile

# 環境変数の反映
source /etc/profile

# バージョンと場所の確認
echo $GRADLE_HOME
echo $PATH
gradle -v
which gradle

exit 0
