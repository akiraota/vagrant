#!/bin/bash

# SRC INSTALL
cp /vagrant/conf/apache/httpd-2.2.11.tar.gz /usr/local/httpd-2.2.11.tar.gz
cd /usr/local
tar -zxvf httpd-2.2.11.tar.gz
cd ./httpd-2.2.11
./configure --enable-proxy --enable-proxy-ajp
make
make install

# /usr/local/apache2/conf/httpd.conf
cp -p /usr/local/apache2/conf/httpd.conf /usr/local/apache2/conf/httpd.conf.org
cat << CONF >> /usr/local/apache2/conf/httpd.conf
<Location /jac/>
 ProxyPass ajp://localhost:8009/jac/
</Location>
<Location /seiseki/>
 ProxyPass ajp://localhost:8009/seiseki/
</Location>
CONF

chown jac:jac -R /usr/local/apache2

exit 0
