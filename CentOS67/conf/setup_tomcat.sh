#!/bin/bash

export CATALINA_HOME=/usr/local/tomcat

# INSTALL
cd /vagrant/conf/tomcat
cp ./jakarta-tomcat-5.0.30.tar.gz /usr/local/jakarta-tomcat-5.0.30.tar.gz
cd /usr/local
tar -zxvf jakarta-tomcat-5.0.30.tar.gz
mv jakarta-tomcat-5.0.30 tomcat

# /home/jac/.bash_profile
echo 'CATALINA_HOME=/usr/local/tomcat' >> /home/jac/.bash_profile
echo 'export CATALINA_HOME' >> /home/jac/.bash_profile
echo 'PATH=$PATH:$CATALINA_HOME/bin' >> /home/jac/.bash_profile
echo 'export PATH' >> /home/jac/.bash_profile
echo 'CLASS_PATH=$CLASS_PATH:$CATALINA_HOME/common/lib:/home/jac/webapps/WEB-INF/classes:/home/seiseki/webapps/WEB-INF/classes' >> /home/jac/.bash_profile
echo 'export CLASS_PATH' >> /home/jac/.bash_profile
source /home/jac/.bash_profile

# ./bin/catalina.sh
cp -p $CATALINA_HOME/bin/catalina.sh $CATALINA_HOME/bin/catalina.sh.org
/bin/cp -f /vagrant/conf/tomcat/catalina.sh $CATALINA_HOME/bin/catalina.sh

# ./conf/server.xml
cp -p $CATALINA_HOME/conf/server.xml $CATALINA_HOME/conf/server.xml.org
/bin/cp -f /vagrant/conf/tomcat/server.xml $CATALINA_HOME/conf/server.xml

# ./conf/tomcat-users.xml
cp -p $CATALINA_HOME/conf/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml.org
/bin/cp -f /vagrant/conf/tomcat/tomcat-users.xml $CATALINA_HOME/conf/tomcat-users.xml

# ./server/webapps/admin/WEB-INF/struts-config.xml
cp -p $CATALINA_HOME/server/webapps/admin/WEB-INF/struts-config.xml $CATALINA_HOME/server/webapps/admin/WEB-INF/struts-config.xml.org
/bin/cp -f /vagrant/conf/struts/struts-config.xml $CATALINA_HOME/server/webapps/admin/WEB-INF/struts-config.xml

# ./conf/Catalina/localhost/jac.xml
cp /vagrant/conf/tomcat/jac.xml $CATALINA_HOME/conf/Catalina/localhost/jac.xml

# ./conf/Catalina/localhost/seiseki.xml
cp /vagrant/conf/tomcat/seiseki.xml $CATALINA_HOME/conf/Catalina/localhost/seiseki.xml

# JDBC
cp /vagrant/conf/postgresql/postgresql-8.1-412.jdbc3.jar $CATALINA_HOME/common/lib/postgresql-8.1-412.jdbc3.jar

chown jac:jac -R $CATALINA_HOME

exit 0
