#!/bin/sh

WORKSPACE=$HOME/Temp/lab
cd $WORKSPACE

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "The Directory where JBDEV Studio must be installed should be provided as first parameter"
    exit;
fi


# Server to download the integration stack zip file
if [ -z "$2"]
  then
    SERVER='ftp://192.168.1.10/pub'
  else 
  	SERVER="ftp://$2/pub"
fi

# REPO='https://devstudio.jboss.com/updates/7.0-development/integration-stack/'
#      'https://devstudio.jboss.com/updates/7.0/integration-stack/'
#      'https://devstudio.jboss.com/updates/7.0'

# set path to JBoss Developer Studio install folder
JBDS=$1/studio

# set path to JBDS IS update site zip
#JBDSIS_NAME=jbdevstudio-integration-stack-updatesite-7.0.2.CR1.zip
JBDSIS_NAME=jbdevstudio-integration-stack-updatesite-7.0.1.GA.zip

# https://devstudio.jboss.com/updates/7.0
# https://raw.githubusercontent.com/jbosstools/jbosstools-build-ci/master/util/installFromTarget.sh
JBDSIS_RENAMED=jbds-is-updatesite.zip
JBDS_JAR_NAME=jbdevstudio-product-eap-universal-7.1.1.GA-v20140314-2145-B688.jar

# fetch update site zip
wget -N --no-check-certificate ${SERVER}/${JBDSIS_NAME}
ln -s ${JBDSIS_NAME} ${JBDSIS_RENAMED}

# fetch jar file of JBDS
wget -N --no-check-certificate ${SERVER}/${JBDS_JAR_NAME}

# fetch installFromTarget.sh script & run it
wget -N --no-check-certificate ${SERVER}/scripts/installFromTarget.sh
chmod +x installFromTarget.sh

./installFromTarget.sh -ECLIPSE ${JBDS} -INSTALL_PLAN jar:file://${WORKSPACE}/${JBDSIS_RENAMED}!\/,jar:file://${WORKSPACE}/${JBDS_JAR_NAME}\!/
#./installFromTarget.sh -ECLIPSE ${JBDS} -INSTALL_PLAN https://devstudio.jboss.com/updates/7.0/,https://devstudio.jboss.com/updates/7.0/integration-stack/
