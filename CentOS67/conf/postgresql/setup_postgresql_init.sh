#!/bin/bash

export PGSQL_CONF=/vagrant/conf/postgresql

# CLEATE CLUSTER
/usr/local/pgsql/bin/initdb -D $PGDATA --no-locale --encoding=Unicode 1>> $PGSQL_CONF/install.log

# pg_hba.conf
cp -p $PGDATA/pg_hba.conf $PGDATA/pg_hba.conf.org
/bin/cp -f $PGSQL_CONF/pg_hba.conf $PGDATA/pg_hba.conf

# postgresql.conf
cp -p $PGDATA/postgresql.conf $PGDATA/postgresql.conf.org
/bin/cp -f $PGSQL_CONF/postgresql.conf $PGDATA/postgresql.conf

# START
/usr/local/pgsql/bin/pg_ctl -D $PGDATA -l logfile start

# wait
sleep 180

# TABLESPACE
#CREATE TABLESPACE xxxxdbspace LOCATION '/xxxx/data';

# DATABASE
#CREATE DATABASE xxxx WITH OWNER xxxx ENCODING 'UTF8' TABLESPACE xxxxdbspace;
createdb -O xxxx -U xxxx -E UTF-8 xxxx

\q

# CREATE TABLE
psql xxxx -f $PGSQL_CONF/sql/xxxx.sql

# MASTER DATA INPORT
$PGSQL_CONF/xxxx_table_init.sh -m

# TABLE DATA INPORT
$PGSQL_CONF/xxxx_table_init.sh

exit 0
