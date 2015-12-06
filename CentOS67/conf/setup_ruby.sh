#!/bin/bash

# Ruby 2.2.3のインストール
cd /usr/local/src
wget http://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.3.tar.gz
tar zxvf ruby-2.2.3.tar.gz
cd ruby-2.2.3
./configure
make
make install
ln -s /usr/local/bin/ruby /usr/bin/ruby

# バージョンと場所の確認
ruby -v
which ruby

# bundlerのインストール
gem install bundler --no-rdoc --no-ri

exit 0
