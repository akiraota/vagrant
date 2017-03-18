#!/bin/bash

export PGSQL_CONF=/vagrant/conf/postgresql

yum -y install wget

mkdir /jac
cd /jac
mkdir data
chown jac:jac -R /jac

cd /usr
wget http://yum.postgresql.org/8.4/redhat/rhel-6-x86_64/pgdg-centos-8.4-3.noarch.rpm > $PGSQL_CONF/install.log
rpm -ivh pgdg-centos-8.4-3.noarch.rpm >> $PGSQL_CONF/install.log
yum install -y postgresql84-server postgresql84-devel postgresql84-contrib >> $PGSQL_CONF/install.log

chown jac:jac -R /usr/pgsql-8.4

# /etc/rc.d/init.d/postgresql-8.4
cp -p /etc/rc.d/init.d/postgresql-8.4 /etc/rc.d/init.d/postgresql-8.4.org
/bin/cp -f /vagrant/conf/etc/rc.d/init.d/postgresql-8.4 /etc/rc.d/init.d/postgresql-8.4

# /etc/sysconfig/pgsql-8.4/postgres
echo 'PGDATA=/jac/data' > /etc/sysconfig/pgsql/postgres
echo 'PGLOG=/jac/data/pgstartup.log' >> /etc/sysconfig/pgsql/postgres

# /home/jac/.bash_profile
echo 'PATH=$PATH:/usr/pgsql-8.4/bin' >> /home/jac/.bash_profile
echo 'export PATH' >> /home/jac/.bash_profile
echo 'POSTGRES_HOME=/usr/pgsql-8.4' >> /home/jac/.bash_profile
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
