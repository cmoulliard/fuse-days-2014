#!/bin/bash

#
# To retrieve this file, run this command
#
# rm *.sh
# wget ftp://192.168.1.7/pub/scripts/all_commands.sh
# chmod +x *.sh
# ./all_commands.sh /Users/chmoulli/Temp/lab/ 192.168.1.7
#

if [ -z eq "$1" ]; 
then
   WORKSPACE=/Users/chmoulli/Temp/lab/
else
   WORKSPACE=$1
fi

if [ -z eq "$2" ]; 
then
   FTP_SERVER="192.168.1.7"
else
   FTP_SERVER=$2
fi

JBOSS_SERVER=jboss-fuse-full-6.1.0.redhat-379
JBDS_INSTALL_JAR=jbdevstudio-product-eap-universal-7.1.1.GA-v20140314-2145-B688.jar
JBDS_DIR_NAME=jbds-7.1

# Get script files
wget ftp://$FTP_SERVER/pub/scripts/install_JBF.sh
wget ftp://$FTP_SERVER/pub/scripts/install_JBDS.sh
wget ftp://$FTP_SERVER/pub/scripts/install_IS2.sh
wget ftp://$FTP_SERVER/pub/scripts/updateMavenSettings.sh

# change mode to execution
chmod +x *.sh

# Install JBoss Fuse
./install_JBF.sh $WORKSPACE $JBOSS_SERVER $FTP_SERVER

# Install JBDS Studio
./install_JBDS.sh $WORKSPACE $JBDS_DIR_NAME $JBDS_INSTALL_JAR $FTP_SERVER

# Post Installation JBDS
./install_IS2.sh $WORKSPACE $JBDS_DIR_NAME $FTP_SERVER

# Post Installation JBDS
./updateMavenSettings.sh $FTP_SERVER