#!/bin/sh
echo "Setting ENV/ARG variables"
sed -i "s/<mysql_login>YOUR_MYSQL_LOGIN/<mysql_login>${MYSQL_LOGIN}/" localdatabase.xml
sed -i "s/<mysql_password>YOUR_MYSQL_PASSWORD/<mysql_password>${MYSQL_PASSWORD}/" localdatabase.xml
sed -i "s/<mysql_server>localhost/<mysql_server>${MYSQL_SERVER}/" localdatabase.xml
sed -i "s/<\/masteradmins>/<tmlogin>${ASECO_MASTER_ADMIN}<\/tmlogin><\/masteradmins>/" config.xml
sed -i "s/<password>YOUR_SUPERADMIN_PASSWORD/<password>${SERVER_SA_PASSWORD}/" config.xml
sed -i "s/<\/admins>/<tmlogin>${ASECO_ADMIN}<\/tmlogin><\/admins>/" adminops.xml
sed -i "s/\t<plugin>plugin.dedimania.php<\/plugin>/<\!--\t<plugin>plugin.dedimania.php<\/plugin> -->/" plugins.xml
sed -i "s/\t<plugin>chat.dedimania.php<\/plugin>/<\!--\t<plugin>chat.dedimania.php<\/plugin> -->/" plugins.xml
