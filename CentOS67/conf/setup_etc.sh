#!/bin/bash

# Tomcat
echo 'export JAVA_HOME=/usr/local/j2sdk1.4.2_17' >> /etc/rc.d/rc.local
echo 'export CATALINA_HOME=/usr/local/tomcat' >> /etc/rc.d/rc.local
echo 'export PATH=$PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin' >> /etc/rc.d/rc.local
echo 'export CLASSPATH=.:$JAVA_HOME/lib/tools.jar:$CATALINA_HOME/common/lib:/home/jac/webapps/WEB-INF/classes:/home/seiseki/webapps/WEB-INF/classes' >> /etc/rc.d/rc.local
echo '$CATALINA_HOME/bin/startup.sh jpda' >> /etc/rc.d/rc.local

# Apache
echo '/usr/local/apache2/bin/apachectl start' >> /etc/rc.d/rc.local

# PostgreSQL
#/bin/cp -f /usr/local/src/postgresql-8.1.#cp -p /usr/local/postgresql-8.4/contrib/start-scripts/linux /etc/rc.d/init.d/postgresql-8.4
#cd /etc/rc.d/init.d-8.4
#chmod 755 postgresql-8.4
/sbin/chkconfig postgresql-8.4 on

#/contrib/start-scripts/linux /etc/rc.d/init.d/postgresql
#/bin/cp -f /vagrant/conf/etc/rc.d/init.d/postgresql /etc/rc.d/init.d/postgresql
#cd /etc/rc.d/init.d
#chmod 755 postgresql
#/sbin/chkconfig postgresql on

# /etc/sysconfig/pgsql/postgres
#cd /etc/sysconfig
#mkdir pgsql
#echo 'PGDATA=/jac/data' > /etc/sysconfig/pgsql/postgres
#echo 'PGLOG=/jac/data/pgstartup.log' >> /etc/sysconfig/pgsql/postgres

exit 0
