#!/bin/bash

# LIBLARY
yum -y install wget
yum -y install readline-devel ncurses-devel zlib-devel

# DATA DIRECTORY
mkdir /jac
cd /jac
mkdir data
chown jac:jac -R /jac

# SRC INSTALL
#wget http://yum.postgresql.org/8.1/redhat/rhel-5-x86_64/postgresql-8.1.23-1PGDG.rhel5.x86_64.rpm
#wget http://yum.postgresql.org/8.1/redhat/rhel-5-x86_64/postgresql-libs-8.1.23-1PGDG.rhel5.x86_64.rpm
#wget http://yum.postgresql.org/8.1/redhat/rhel-5-x86_64/postgresql-server-8.1.23-1PGDG.rhel5.x86_64.rpm
#rpm -ivh postgresql-libs-8.1.23-1PGDG.rhel5.x86_64.rpm
#rpm -ivh postgresql-8.1.23-1PGDG.rhel5.x86_64.rpm
#rpm -ivh postgresql-server-8.1.23-1PGDG.rhel5.x86_64.rpm
#yum install -y postgresql-server postgresql-devel postgresql-contrib
#rpm -e postgresql-devel
#rpm -e postgresql-server
#rpm -e postgresql
cp /vagrant/conf/postgresql/postgresql-8.1.23.tar.gz /usr/local/src/postgresql-8.1.23.tar.gz
cd /usr/local/src
gunzip postgresql-8.1.23.tar.gz
tar -xf postgresql-8.1.23.tar
cd postgresql-8.1.23
./configure --enable-multibyte=Unicode
make all
make install
chown jac:jac -R /usr/local/pgsql

# /home/jac/.bash_profile
echo 'PATH=$PATH:/usr/local/pgsql/bin' >> /home/jac/.bash_profile
echo 'export PATH' >> /home/jac/.bash_profile
echo 'POSTGRES_HOME=/usr/local/pgsql' >> /home/jac/.bash_profile
echo 'export POSTGRES_HOME' >> /home/jac/.bash_profile
echo 'PGLIB=$POSTGRES_HOME/lib' >> /home/jac/.bash_profile
echo 'export PGLIB' >> /home/jac/.bash_profile
echo 'PGDATA=/jac/data' >> /home/jac/.bash_profile
echo 'export PGDATA' >> /home/jac/.bash_profile
echo 'MANPATH=$POSTGRES_HOME/man' >> /home/jac/.bash_profile
echo 'export MANPATH' >> /home/jac/.bash_profile
echo 'LD_LIBRARY_PATH=$LD_LIBRARYPATH:$PGLIB' >> /home/jac/.bash_profile
echo 'export LD_LIBRARY_PATH' >> /home/jac/.bash_profile
source /home/jac/.bash_profile

exit 0
